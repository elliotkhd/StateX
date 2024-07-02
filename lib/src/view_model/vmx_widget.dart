import 'package:flutter/material.dart';
import 'package:statyx/statyx.dart';

abstract class Vmx<VM extends ViewModel> extends StatefulWidget {
  const Vmx({super.key});

  VM createViewModel();

  Widget build(BuildContext context, VM vm);

  @override
  State<Vmx> createState() => _VmxState<VM>();
}

class _VmxState<VM extends ViewModel> extends VMState<Vmx<VM>, VM> {
  @override
  Widget build(BuildContext context) => widget.build(context, vm);

  @override
  ViewModel createViewModel() => widget.createViewModel();
}
