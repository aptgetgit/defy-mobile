// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../stake_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StakeState {
// Selected provider information
  String get providerName => throw _privateConstructorUsedError;
  String get providerLogoPath => throw _privateConstructorUsedError;
  String get apy => throw _privateConstructorUsedError;
  String get investors => throw _privateConstructorUsedError;
  bool get isDelegate => throw _privateConstructorUsedError; // Amount selection
  String get stakeAmount => throw _privateConstructorUsedError;
  String get stakeAmountInAPT => throw _privateConstructorUsedError;
  String get selectedTimePeriod => throw _privateConstructorUsedError;
  double get investmentAmount => throw _privateConstructorUsedError;
  String get selectedAsset => throw _privateConstructorUsedError; // UI state
  int get currentTabIndex => throw _privateConstructorUsedError;
  bool get isSearchIconVisible =>
      throw _privateConstructorUsedError; // Investment calculator
  int get calculatorTab =>
      throw _privateConstructorUsedError; // Provider filtering
  String get searchQuery => throw _privateConstructorUsedError;
  int get filterIndex => throw _privateConstructorUsedError;

  /// Create a copy of StakeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StakeStateCopyWith<StakeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakeStateCopyWith<$Res> {
  factory $StakeStateCopyWith(
          StakeState value, $Res Function(StakeState) then) =
      _$StakeStateCopyWithImpl<$Res, StakeState>;
  @useResult
  $Res call(
      {String providerName,
      String providerLogoPath,
      String apy,
      String investors,
      bool isDelegate,
      String stakeAmount,
      String stakeAmountInAPT,
      String selectedTimePeriod,
      double investmentAmount,
      String selectedAsset,
      int currentTabIndex,
      bool isSearchIconVisible,
      int calculatorTab,
      String searchQuery,
      int filterIndex});
}

/// @nodoc
class _$StakeStateCopyWithImpl<$Res, $Val extends StakeState>
    implements $StakeStateCopyWith<$Res> {
  _$StakeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StakeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerName = null,
    Object? providerLogoPath = null,
    Object? apy = null,
    Object? investors = null,
    Object? isDelegate = null,
    Object? stakeAmount = null,
    Object? stakeAmountInAPT = null,
    Object? selectedTimePeriod = null,
    Object? investmentAmount = null,
    Object? selectedAsset = null,
    Object? currentTabIndex = null,
    Object? isSearchIconVisible = null,
    Object? calculatorTab = null,
    Object? searchQuery = null,
    Object? filterIndex = null,
  }) {
    return _then(_value.copyWith(
      providerName: null == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      providerLogoPath: null == providerLogoPath
          ? _value.providerLogoPath
          : providerLogoPath // ignore: cast_nullable_to_non_nullable
              as String,
      apy: null == apy
          ? _value.apy
          : apy // ignore: cast_nullable_to_non_nullable
              as String,
      investors: null == investors
          ? _value.investors
          : investors // ignore: cast_nullable_to_non_nullable
              as String,
      isDelegate: null == isDelegate
          ? _value.isDelegate
          : isDelegate // ignore: cast_nullable_to_non_nullable
              as bool,
      stakeAmount: null == stakeAmount
          ? _value.stakeAmount
          : stakeAmount // ignore: cast_nullable_to_non_nullable
              as String,
      stakeAmountInAPT: null == stakeAmountInAPT
          ? _value.stakeAmountInAPT
          : stakeAmountInAPT // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimePeriod: null == selectedTimePeriod
          ? _value.selectedTimePeriod
          : selectedTimePeriod // ignore: cast_nullable_to_non_nullable
              as String,
      investmentAmount: null == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedAsset: null == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as String,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSearchIconVisible: null == isSearchIconVisible
          ? _value.isSearchIconVisible
          : isSearchIconVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      calculatorTab: null == calculatorTab
          ? _value.calculatorTab
          : calculatorTab // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filterIndex: null == filterIndex
          ? _value.filterIndex
          : filterIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StakeStateImplCopyWith<$Res>
    implements $StakeStateCopyWith<$Res> {
  factory _$$StakeStateImplCopyWith(
          _$StakeStateImpl value, $Res Function(_$StakeStateImpl) then) =
      __$$StakeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String providerName,
      String providerLogoPath,
      String apy,
      String investors,
      bool isDelegate,
      String stakeAmount,
      String stakeAmountInAPT,
      String selectedTimePeriod,
      double investmentAmount,
      String selectedAsset,
      int currentTabIndex,
      bool isSearchIconVisible,
      int calculatorTab,
      String searchQuery,
      int filterIndex});
}

/// @nodoc
class __$$StakeStateImplCopyWithImpl<$Res>
    extends _$StakeStateCopyWithImpl<$Res, _$StakeStateImpl>
    implements _$$StakeStateImplCopyWith<$Res> {
  __$$StakeStateImplCopyWithImpl(
      _$StakeStateImpl _value, $Res Function(_$StakeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StakeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerName = null,
    Object? providerLogoPath = null,
    Object? apy = null,
    Object? investors = null,
    Object? isDelegate = null,
    Object? stakeAmount = null,
    Object? stakeAmountInAPT = null,
    Object? selectedTimePeriod = null,
    Object? investmentAmount = null,
    Object? selectedAsset = null,
    Object? currentTabIndex = null,
    Object? isSearchIconVisible = null,
    Object? calculatorTab = null,
    Object? searchQuery = null,
    Object? filterIndex = null,
  }) {
    return _then(_$StakeStateImpl(
      providerName: null == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      providerLogoPath: null == providerLogoPath
          ? _value.providerLogoPath
          : providerLogoPath // ignore: cast_nullable_to_non_nullable
              as String,
      apy: null == apy
          ? _value.apy
          : apy // ignore: cast_nullable_to_non_nullable
              as String,
      investors: null == investors
          ? _value.investors
          : investors // ignore: cast_nullable_to_non_nullable
              as String,
      isDelegate: null == isDelegate
          ? _value.isDelegate
          : isDelegate // ignore: cast_nullable_to_non_nullable
              as bool,
      stakeAmount: null == stakeAmount
          ? _value.stakeAmount
          : stakeAmount // ignore: cast_nullable_to_non_nullable
              as String,
      stakeAmountInAPT: null == stakeAmountInAPT
          ? _value.stakeAmountInAPT
          : stakeAmountInAPT // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimePeriod: null == selectedTimePeriod
          ? _value.selectedTimePeriod
          : selectedTimePeriod // ignore: cast_nullable_to_non_nullable
              as String,
      investmentAmount: null == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedAsset: null == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as String,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSearchIconVisible: null == isSearchIconVisible
          ? _value.isSearchIconVisible
          : isSearchIconVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      calculatorTab: null == calculatorTab
          ? _value.calculatorTab
          : calculatorTab // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filterIndex: null == filterIndex
          ? _value.filterIndex
          : filterIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StakeStateImpl implements _StakeState {
  const _$StakeStateImpl(
      {this.providerName = '',
      this.providerLogoPath = '',
      this.apy = '0%',
      this.investors = '',
      this.isDelegate = false,
      this.stakeAmount = '0',
      this.stakeAmountInAPT = '0',
      this.selectedTimePeriod = '1M',
      this.investmentAmount = 10000,
      this.selectedAsset = 'APT',
      this.currentTabIndex = 0,
      this.isSearchIconVisible = false,
      this.calculatorTab = 0,
      this.searchQuery = '',
      this.filterIndex = 0});

// Selected provider information
  @override
  @JsonKey()
  final String providerName;
  @override
  @JsonKey()
  final String providerLogoPath;
  @override
  @JsonKey()
  final String apy;
  @override
  @JsonKey()
  final String investors;
  @override
  @JsonKey()
  final bool isDelegate;
// Amount selection
  @override
  @JsonKey()
  final String stakeAmount;
  @override
  @JsonKey()
  final String stakeAmountInAPT;
  @override
  @JsonKey()
  final String selectedTimePeriod;
  @override
  @JsonKey()
  final double investmentAmount;
  @override
  @JsonKey()
  final String selectedAsset;
// UI state
  @override
  @JsonKey()
  final int currentTabIndex;
  @override
  @JsonKey()
  final bool isSearchIconVisible;
// Investment calculator
  @override
  @JsonKey()
  final int calculatorTab;
// Provider filtering
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int filterIndex;

  @override
  String toString() {
    return 'StakeState(providerName: $providerName, providerLogoPath: $providerLogoPath, apy: $apy, investors: $investors, isDelegate: $isDelegate, stakeAmount: $stakeAmount, stakeAmountInAPT: $stakeAmountInAPT, selectedTimePeriod: $selectedTimePeriod, investmentAmount: $investmentAmount, selectedAsset: $selectedAsset, currentTabIndex: $currentTabIndex, isSearchIconVisible: $isSearchIconVisible, calculatorTab: $calculatorTab, searchQuery: $searchQuery, filterIndex: $filterIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StakeStateImpl &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.providerLogoPath, providerLogoPath) ||
                other.providerLogoPath == providerLogoPath) &&
            (identical(other.apy, apy) || other.apy == apy) &&
            (identical(other.investors, investors) ||
                other.investors == investors) &&
            (identical(other.isDelegate, isDelegate) ||
                other.isDelegate == isDelegate) &&
            (identical(other.stakeAmount, stakeAmount) ||
                other.stakeAmount == stakeAmount) &&
            (identical(other.stakeAmountInAPT, stakeAmountInAPT) ||
                other.stakeAmountInAPT == stakeAmountInAPT) &&
            (identical(other.selectedTimePeriod, selectedTimePeriod) ||
                other.selectedTimePeriod == selectedTimePeriod) &&
            (identical(other.investmentAmount, investmentAmount) ||
                other.investmentAmount == investmentAmount) &&
            (identical(other.selectedAsset, selectedAsset) ||
                other.selectedAsset == selectedAsset) &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                other.currentTabIndex == currentTabIndex) &&
            (identical(other.isSearchIconVisible, isSearchIconVisible) ||
                other.isSearchIconVisible == isSearchIconVisible) &&
            (identical(other.calculatorTab, calculatorTab) ||
                other.calculatorTab == calculatorTab) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.filterIndex, filterIndex) ||
                other.filterIndex == filterIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      providerName,
      providerLogoPath,
      apy,
      investors,
      isDelegate,
      stakeAmount,
      stakeAmountInAPT,
      selectedTimePeriod,
      investmentAmount,
      selectedAsset,
      currentTabIndex,
      isSearchIconVisible,
      calculatorTab,
      searchQuery,
      filterIndex);

  /// Create a copy of StakeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StakeStateImplCopyWith<_$StakeStateImpl> get copyWith =>
      __$$StakeStateImplCopyWithImpl<_$StakeStateImpl>(this, _$identity);
}

abstract class _StakeState implements StakeState {
  const factory _StakeState(
      {final String providerName,
      final String providerLogoPath,
      final String apy,
      final String investors,
      final bool isDelegate,
      final String stakeAmount,
      final String stakeAmountInAPT,
      final String selectedTimePeriod,
      final double investmentAmount,
      final String selectedAsset,
      final int currentTabIndex,
      final bool isSearchIconVisible,
      final int calculatorTab,
      final String searchQuery,
      final int filterIndex}) = _$StakeStateImpl;

// Selected provider information
  @override
  String get providerName;
  @override
  String get providerLogoPath;
  @override
  String get apy;
  @override
  String get investors;
  @override
  bool get isDelegate; // Amount selection
  @override
  String get stakeAmount;
  @override
  String get stakeAmountInAPT;
  @override
  String get selectedTimePeriod;
  @override
  double get investmentAmount;
  @override
  String get selectedAsset; // UI state
  @override
  int get currentTabIndex;
  @override
  bool get isSearchIconVisible; // Investment calculator
  @override
  int get calculatorTab; // Provider filtering
  @override
  String get searchQuery;
  @override
  int get filterIndex;

  /// Create a copy of StakeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StakeStateImplCopyWith<_$StakeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
