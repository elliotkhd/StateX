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

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.initialValue = 0,
  });

  final int initialValue;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends VMState<HomePage, HomeViewModel> {
  @override
  ViewModel createViewModel() => HomeViewModel();

  @override
  Widget build(BuildContext context) {
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
    counter.value = widget.initialValue;
  }

  @override
  void onClose() {}
}
