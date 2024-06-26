part of 'view_model.dart';

abstract class VMState<T extends StatefulWidget, VM extends ViewModel>
    extends State<T> {
  /// [vm] instance.
  late final VM vm = createViewModel() as VM;

  /// create [vm] instance.
  ///
  /// must be override.
  ViewModel createViewModel();

  @override
  void initState() {
    super.initState();
    assert(vm.typeOfWidget == T, 'Widget Type in $VM should be $T');
    assert(vm.initiated == false, 'ViewModel already initiated');
    vm.widget = widget;
    vm.onInit();
    vm.initiated = true;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) => vm.onReady());
  }

  @override
  void dispose() {
    super.dispose();
    assert(vm.closed == false, 'ViewModel already disposed');
    vm.onClose();
    vm.closed = true;
  }
}
