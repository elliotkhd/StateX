State management for Flutter.

## Motivation

Most of the time, I don't need all the features in GetX. Based on my experience, I extracted these frequently used functions and made some changes.

## Features

- All Rx types from GetX(RxInt, RxList..)
- Obx from GetX
- ViewModel that observes Widget life circle (onInit, onReady, onClose)

## Usage

```dart
//ViewModel
class HomeViewModel extends ViewModel {
  final counter = 0.obs;

  @override
  void onInit() {} // called in initState()

  @override
  void onClose() {} // called in dispose()
}

//View
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
        body: Center(child: Obx(() => Text('${vm.counter.value}'))),
      ),
    );
  }
}




```

