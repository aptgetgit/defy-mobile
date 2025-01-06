// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

class CardColor {
  final int index;
  final Color color;
  CardColor({required this.index, required this.color});

  CardColor copyWith({
    int? index,
    Color? color,
  }) {
    return CardColor(
      index: index ?? this.index,
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'CardColor(index: $index, color: $color)';
}
