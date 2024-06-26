import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'vm_state.dart';

abstract class ViewModel<T extends Widget> {
  late T widget;
  bool initiated = false;
  bool closed = false;
  final Type typeOfWidget;

  ViewModel() : typeOfWidget = T;

  void onInit() {}

  void onReady() {}

  void onClose() {}
}
