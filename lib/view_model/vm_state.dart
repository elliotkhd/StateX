part of statyx;

abstract class VMState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  /// [logic] instance.
  late final VM logic = createViewModel();

  /// create [logic] instance.
  ///
  /// must be override.
  VM createViewModel();

  @override
  void initState() {
    logic.onInit();
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => logic.onReady());
    super.initState();
  }

  @override
  void dispose() {
    logic.onClose();
    super.dispose();
  }
}
