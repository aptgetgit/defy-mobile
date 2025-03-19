import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/deep_link_provider.g.dart';

@Riverpod(keepAlive: true)
class PendingDeepLink extends _$PendingDeepLink {
  @override
  Option<Uri> build() => const Option<Uri>.none();

  void set(Option<Uri> deepLink) => state = deepLink;

  void clear() => state = const Option<Uri>.none();
}
