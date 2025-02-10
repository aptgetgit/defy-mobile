import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/marketplace_filter_state_model.freezed.dart';

@freezed
class MarketplaceFilterStateModel with _$MarketplaceFilterStateModel {
  const factory MarketplaceFilterStateModel({
    @Default(['Volume']) List<String> selectedSortBy,
    @Default(['24 Hrs']) List<String> selectedPeriod,
    @Default(false) bool isAscending,
  }) = _MarketplaceFilterStateModel;
}