import 'package:flutter/material.dart';
import 'package:statyx/statyx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Vmx(
        create: () => HomeViewModel(),
        builder: (vm) => Scaffold(
          appBar: AppBar(title: const Text('Hello StatyX')),
          floatingActionButton: FloatingActionButton(
            onPressed: () => vm.counter.value++,
            child: const Icon(Icons.add),
          ),
          body: Center(child: Obx(() => Text('${vm.counter.value}'))),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Vmx(
      create: () => HomeViewModel(),
      builder: (vm) => Scaffold(
        appBar: AppBar(title: const Text('Hello StatyX')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => vm.counter.value++,
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Obx(
            () => Text('${vm.counter.value}'),
          ),
        ),
      ),
    );
  }
}

class HomeViewModel extends ViewModel {
  final counter = 0.obs;

  @override
  void onInit() {}

  @override
  void onClose() {}
}
