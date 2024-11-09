
import 'package:defy/features/yield/domain/yield_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/yield_view_provider.g.dart';

@Riverpod(keepAlive: true)
class YieldViewProvider extends _$YieldViewProvider {
  @override
  YieldStateModel build() {
    return YieldStateModel(toggleSingleMulti: true);
    
  }

  void toggleSingleMulti() {
    state = state.copyWith(toggleSingleMulti: !state.toggleSingleMulti);
  }

}




