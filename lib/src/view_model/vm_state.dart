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
    vm.widget = widget;
    vm.onInit();
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => vm.onReady());
  }

  @override
  void dispose() {
    super.dispose();
    vm.onClose();
  }
}
