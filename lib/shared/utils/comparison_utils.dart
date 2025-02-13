import 'dart:typed_data';

import 'package:collection/collection.dart';


bool areByteListsEqual(Uint8List? list1, Uint8List? list2) => const ListEquality<int>().equals(list1, list2);
