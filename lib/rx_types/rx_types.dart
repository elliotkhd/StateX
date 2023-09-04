library rx_types;

import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';

part 'rx_core/rx_impl.dart';
part 'rx_core/rx_interface.dart';
part 'rx_core/rx_num.dart';
part 'rx_core/rx_string.dart';

part 'rx_iterables/rx_list.dart';
part 'rx_iterables/rx_set.dart';
part 'rx_iterables/rx_map.dart';

part 'rx_stream/get_stream.dart';

typedef Condition = bool Function();
typedef OnData<T> = void Function(T data);
typedef Callback = void Function();
