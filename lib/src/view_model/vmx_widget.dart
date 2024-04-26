import 'package:flutter/material.dart';

import 'view_model.dart';

class Vmx<VM extends ViewModel> extends StatefulWidget {
  const Vmx({super.key, required this.create, required this.builder});

  final VM Function() create;
  final Widget Function(VM vm) builder;

  @override
  State<Vmx> createState() => _VmxState<VM>();
}

class _VmxState<VM extends ViewModel> extends VMState<Vmx<VM>, VM> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(viewModel);
  }

  @override
  ViewModel createViewModel() {
    return widget.create();
  }
}
