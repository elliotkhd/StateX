import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'vm_state.dart';

abstract class ViewModel {
  void onInit() {}

  void onReady() {}

  void onClose() {}
}
