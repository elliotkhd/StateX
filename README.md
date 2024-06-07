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
class HomeViewModel extends ViewModel<HomePage> {
  final counter = 0.obs;

  @override
  void onInit() {
    counter.value = widget.initialValue;
  }

  @override
  void onClose() {}
}

//View

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
```

