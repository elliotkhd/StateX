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

## Getting started

[GetX State Management](https://github.com/jonataslaw/getx#state-management)

## Usage

```dart
final name = RxString('StateX');
Obx(() => Text(name.value));
```