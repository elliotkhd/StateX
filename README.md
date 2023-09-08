<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

State management for Flutter, drawn out from GetX.

## Features

- All Rx types from GetX(RxInt, RxList..)
- Obx from GetX
- ViewModel that observe life circle event 

## Getting started

[GetX State Management](https://github.com/jonataslaw/getx#state-management)

## Usage

```dart
//ViewModel
class HomeViewModel extends ViewModel {
  final counter = 0.obs;

  @override
  void onInit() {}

  @override
  void onClose() {}
}

//View
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



```