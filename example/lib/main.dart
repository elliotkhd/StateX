import 'package:flutter/material.dart';
import 'package:statyx/statyx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage(initialValue: 10));
  }
}

class HomePage extends Vmx<HomeViewModel> {
  const HomePage({
    super.key,
    this.initialValue = 0,
  });

  final int initialValue;

  @override
  HomeViewModel createViewModel() => HomeViewModel();

  @override
  Widget build(context, vm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello StatyX')),
      floatingActionButton: FloatingActionButton(
          onPressed: () => vm.counter.value++, child: const Icon(Icons.add)),
      body: Center(child: Obx(() => Text('${vm.counter.value}'))),
    );
  }
}

class HomeViewModel extends ViewModel<HomePage> {
  final counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    counter.value = widget.initialValue;
  }
}
