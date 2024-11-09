import 'package:defy/features/shared/domain/entities/currency_rate.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CurrencyRateLocalModel {
  @Id()
  int localId = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String remoteId;

  @Index(type: IndexType.value)
  String code;

  double rate;

  @Property(type: PropertyType.date)
  DateTime lastUpdate;

  CurrencyRateLocalModel({
    required this.remoteId,
    required this.code,
    required this.rate,
    required this.lastUpdate,
  });

  CurrencyRate toDomain() => CurrencyRate(
    id: remoteId,
    code: code,
    rate: rate,
    lastUpdate: lastUpdate,
  );

  static CurrencyRateLocalModel fromDomain(CurrencyRate rate) =>
      CurrencyRateLocalModel(
        remoteId: rate.id,
        code: rate.code,
        rate: rate.rate,
        lastUpdate: rate.lastUpdate,
      );
}
