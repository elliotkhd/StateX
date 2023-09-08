import 'package:flutter/material.dart';
import 'package:statyx/statyx.dart';

import 'home_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends VMState<HomePage, HomeViewModel> {
  @override
  HomeViewModel createViewModel() => HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello StatyX')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.counter.value++,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${viewModel.counter.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
