part of 'view_model.dart';

abstract class VMState<T extends StatefulWidget, VM extends ViewModel>
    extends State<T> {
  /// [viewModel] instance.
  late final VM viewModel = createViewModel();

  /// create [viewModel] instance.
  ///
  /// must be override.
  VM createViewModel();

  @override
  void initState() {
    viewModel.onInit();
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.onReady());
    super.initState();
  }

  @override
  void dispose() {
    viewModel.onClose();
    super.dispose();
  }
}
