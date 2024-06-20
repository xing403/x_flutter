import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 滑动方向 无，向前，向后
enum _SliderDirectionType { none, forward, reverse }

// 设置 可滑动的宽度 最大 0%, 20%, 40% 50%
enum SliderWidthType { none, small, medium, large }

class XSliderContainer extends StatefulWidget {
  const XSliderContainer({
    super.key,
    required this.child,
    this.leftChild,
    this.rightChild,
    this.openLeftWidth = SliderWidthType.medium,
    this.openRightWidth = SliderWidthType.none,
    this.fixedThereShold = 0.4,
    this.disableSlider = false,
  });

  /// 是否启用滑动
  final bool disableSlider;

  /// 打开宽度% range( 0.0, 1.0)
  final SliderWidthType openLeftWidth;

  /// 打开宽度% range( 0.0, 1.0)
  final SliderWidthType openRightWidth;

  /// 滑层的内容
  final Widget child;

  /// 滑层下方左侧内容
  final Widget? leftChild;

  /// 滑层下方右侧内容
  final Widget? rightChild;

  /// 固定阈值% range( 0.0, 1.0)
  final double fixedThereShold;

  @override
  createState() => _XSliderContainerState();
}

class _XSliderContainerState extends State<XSliderContainer>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool _isActive = false;
  double _lastOffset = 0.0;
  AnimationController? _sliderAnimationController;
  late Animation<Offset> _sliderAnimation;
  @override
  void initState() {
    super.initState();
    _sliderAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: _sliderWidth(widget.openLeftWidth),
      value: 0.0,
    )..addStatusListener(_handleSliderStatusChanged);
    _updateSliderAnimation();
  }

  void _updateSliderAnimation() {
    _sliderAnimation = _sliderAnimationController!.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1, 0),
      ),
    );
  }

  void _updateMoveAnimationState() {}

  Future<void> _handleSliderStatusChanged(AnimationStatus status) async {}

  void _onSliderStart(DragStartDetails details) {
    if (_isActive) return;

    _isActive = true;
  }

  void _onSliderUpdate(DragUpdateDetails details) {
    if (!_isActive || _sliderAnimationController!.isAnimating) return;

    // 更新拖动偏移位置
    double oldLastOffset = _lastOffset;
    _lastOffset += details.primaryDelta!;
    // 当前方向和上次不一致，需要调整动画方向
    if (oldLastOffset.sign != _lastOffset.sign) {
      _resetAnimationDirection();
    }
    // 更新动画最终位置
    if (!_sliderAnimationController!.isAnimating) {
      _sliderAnimationController!.value = _lastOffset / _overallSliderRange;
    }
  }

  Widget? _markChild() {
    return null;
  }

  void _resetAnimationDirection() {
    final double direction = _lastOffset.sign; //  根据最后一次滑动方向，设置动画方向
    _sliderAnimation = _sliderAnimationController!.drive(
      Tween<Offset>(begin: Offset.zero, end: Offset(direction, 0.0)),
    );
  }

  void _onSliderEnd(DragEndDetails details) {
    if (!_isActive) return;
    _isActive = false;

    if (_sliderAnimationController!.isCompleted) {
      _handleAdjustCompleted(); // 动画执行完成后，调整是否可以打开或者可以关闭
      return;
    }
    switch (_currentSliderDirection(details.velocity)) {
      case _SliderDirectionType.forward:
        _sliderAnimationController!.forward();
      case _SliderDirectionType.reverse:
        _sliderAnimationController!.reverse();
      case _SliderDirectionType.none:
        if (_isInOpenRange()) {
          _sliderAnimationController!.forward();
        } else {
          _sliderAnimationController!.reverse();
        }
    }
    _lastOffset = _isInOpenRange()
        ? _overallSliderRange * _sliderWidth(widget.openLeftWidth)
        : 0.0;
  }

  void _handleAdjustCompleted() {
    bool isForward = _isInOpenRange();

    isForward
        ? _sliderAnimationController!.forward()
        : _sliderAnimationController!.reverse();

    _lastOffset = isForward
        ? _overallSliderRange * _sliderWidth(widget.openLeftWidth)
        : 0.0;
  }

  Widget _getMarkChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: _sliderWidthToInt(widget.openLeftWidth),
          child: widget.leftChild ?? Container(),
        ),
        Expanded(
          flex: 10 -
              _sliderWidthToInt(widget.openLeftWidth) -
              _sliderWidthToInt(widget.openRightWidth),
          child: Container(),
        ),
        Expanded(
          flex: _sliderWidthToInt(widget.openRightWidth),
          child: Container(),
        ),
      ],
    );
  }

  Widget _getSliderChild() {
    return SlideTransition(
      position: _sliderAnimation,
      child: KeyedSubtree(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: widget.child,
        ),
      ),
    );
  }

  Widget _getChild() {
    /// 创建一个堆叠容器，上层可拖动
    // Widget? markChild = _markChild();
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRect(
            clipper: _CustomSliderClipper(
              axis: Axis.horizontal,
              moveAnimation: _sliderAnimation,
            ),
            child: _getMarkChild(),
          ),
        ),
        _getSliderChild()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = _getChild();
    if (widget.disableSlider) return child;

    return GestureDetector(
      onHorizontalDragStart: _onSliderStart,
      onHorizontalDragUpdate: _onSliderUpdate,
      onHorizontalDragEnd: _onSliderEnd,
      child: child,
    );
  }

  @override
  bool get wantKeepAlive => (_sliderAnimationController?.isAnimating ?? false);
  // 获取可拖动的实际宽度
  double get _overallSliderRange => context.size!.width;

  // 获取当前滑动方向
  _SliderDirectionType _currentSliderDirection(Velocity velocity) {
    if (_lastOffset == 0.0 ||
        _lastOffset ==
            _overallSliderRange * _sliderWidth(widget.openLeftWidth)) {
      return _SliderDirectionType.none;
    }

    final double vx = velocity.pixelsPerSecond.dx;

    // 当前 x 轴方向速度不为 0， 继续以这个方向运动
    if (vx != 0.0 &&
        vx.abs() <
            _overallSliderRange *
                _sliderWidth(widget.openLeftWidth) *
                widget.fixedThereShold) {
      return _SliderDirectionType.none;
    }

    return _isNotInOpenRange()
        ? _SliderDirectionType.reverse
        : _SliderDirectionType.forward;
  }

  double _sliderWidth(SliderWidthType type) {
    switch (type) {
      case SliderWidthType.none:
        return 0.0;
      case SliderWidthType.small:
        return 0.2;
      case SliderWidthType.medium:
        return 0.4;
      case SliderWidthType.large:
        return 0.5;
    }
  }

  int _sliderWidthToInt(SliderWidthType type) {
    switch (type) {
      case SliderWidthType.none:
        return 0;
      case SliderWidthType.small:
        return 2;
      case SliderWidthType.medium:
        return 4;
      case SliderWidthType.large:
        return 5;
    }
  }

  // 当前移动位置是否在打开的域内
  bool _isInOpenRange() => !_isNotInOpenRange();

  bool _isNotInOpenRange() =>
      _lastOffset <
      _overallSliderRange *
          _sliderWidth(widget.openLeftWidth) *
          (1 - widget.fixedThereShold);
}

class _CustomSliderClipper extends CustomClipper<Rect> {
  _CustomSliderClipper({
    required this.axis,
    required this.moveAnimation,
  }) : super(reclip: moveAnimation);

  final Axis axis;
  final Animation<Offset> moveAnimation;

  @override
  Rect getClip(Size size) {
    final double offset = moveAnimation.value.dx * size.width;
    if (offset < 0) {
      return Rect.fromLTRB(size.width + offset, 0.0, size.width, size.height);
    }
    return Rect.fromLTRB(0.0, 0.0, offset, size.height);
  }

  @override
  Rect getApproximateClipRect(Size size) => getClip(size);

  @override
  bool shouldReclip(_CustomSliderClipper oldClipper) {
    return oldClipper.axis != axis ||
        oldClipper.moveAnimation.value != moveAnimation.value;
  }
}
