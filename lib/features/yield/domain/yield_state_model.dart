import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/domain/single_or_multi_abstract_class.dart';

class YieldStateModel{
  final bool toggleSingleMulti;

  YieldStateModel( {
    required this.toggleSingleMulti,
  });

  YieldStateModel copyWith({
    bool? toggleSingleMulti,
  }) {
    return YieldStateModel(
      toggleSingleMulti: toggleSingleMulti ?? this.toggleSingleMulti,
    );
  }
}
