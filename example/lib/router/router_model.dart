import 'package:flutter/material.dart';

typedef PageBuilder = Widget Function(BuildContext context, RouteModel model);

class RouteModel {
  RouteModel({
    required this.name,
    required this.path,
    required this.builder,
  });

  final String name;
  final String path;

  final PageBuilder builder;
}
