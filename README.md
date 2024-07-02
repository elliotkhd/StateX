State management for Flutter.

## Motivation

Most of the time, I don't need all the features in GetX. Based on my experience, I extracted these frequently used
functions and made some changes.

---

## Features

- All Rx types from GetX(RxInt, RxList..)
- Obx from GetX
- ViewModel that observes Widget life circle (onInit, onReady, onClose)

---

## Usage

1. Without state (No need to declare a VMState)
   ```dart
   class HomePage extends Vmx<HomeViewModel> {
     const HomePage({this.initialValue = 0});
   
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
   ```

2. With state (access `vm` everywhere in the VMState)
   ```dart
   class HomePage extends StatefulWidget {
      const HomePage({this.initialValue = 0});
   
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

- ViewModel
   ```dart
    class HomeViewModel extends ViewModel<HomePage> {
      final counter = 0.obs;
    
      @override
      void onInit() {
        super.onInit();
        counter.value = widget.initialValue;
      }
    }
   ```
