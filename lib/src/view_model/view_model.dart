import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'vm_state.dart';

abstract class ViewModel<T extends Widget> {
  late T widget;
  bool _initiated = false;
  bool _closed = false;

  @mustCallSuper
  void onInit() {
    assert(_initiated == false, 'ViewModel already initiated');
    _initiated = true;
  }

  void onReady() {}

  @mustCallSuper
  void onClose() {
    assert(_closed == false, 'ViewModel already disposed');
    _closed = true;
  }
}
