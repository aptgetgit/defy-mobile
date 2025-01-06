// import 'package:defy/src/features/yield/domain/filter_state_model.dart';
// import 'package:defy/src/features/yield/presentation/enums/yield_risk_filter.dart';
// import 'package:defy/src/features/yield/presentation/enums/yield_sort_filter.dart';
// import 'package:defy/src/features/yield/presentation/enums/yield_type_filter.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'generated/filter_provider.g.dart';

// @Riverpod(keepAlive: true)
// class Filter extends _$Filter {
//   @override
//   FilterStateModel build() {
//     return FilterStateModel(
//       riskFilter: YieldRiskFilter.none,
//       typeFilter: YieldTypeFilter.none,
//       tvlFilter: 0,
//       sortFilter: YieldSortFilter.none,
//     );
//   }

//   void updateRiskFilter(YieldRiskFilter riskFilter) {
//     state = state.copyWith(riskFilter: riskFilter);
//   }

//   void updateTypeFilter(YieldTypeFilter typeFilter) {
//     state = state.copyWith(typeFilter: typeFilter);
//   }

//   void updateTvlFilter(double tvlFilter) {
//     state = state.copyWith(tvlFilter: tvlFilter);
//   }

//   void updateSortFilter(YieldSortFilter sortFilter) {
//     state = state.copyWith(sortFilter: sortFilter);
//   }

//   void resetFilters() {
//     state = state.copyWith(
//       riskFilter: YieldRiskFilter.none,
//       typeFilter: YieldTypeFilter.none,
//       tvlFilter: 0,
//       sortFilter: YieldSortFilter.none,
//     );
//   }
// }
