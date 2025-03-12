// import 'package:objectbox/objectbox.dart';

// import '../../../domain/entities/currency_rate.dart';

// @Entity()
// class CurrencyRateLocalModel {
//   CurrencyRateLocalModel({
//     required this.remoteId,
//     required this.code,
//     required this.rate,
//     required this.lastUpdate,
//   });

//   factory CurrencyRateLocalModel.fromDomain(CurrencyRate rate) =>
//       CurrencyRateLocalModel(
//         remoteId: rate.id,
//         code: rate.code,
//         rate: rate.rate,
//         lastUpdate: rate.lastUpdate,
//       );
//   @Id()
//   int localId = 0;

//   @Unique(onConflict: ConflictStrategy.replace)
//   String remoteId;

//   @Index(type: IndexType.value)
//   String code;

//   double rate;

//   @Property(type: PropertyType.date)
//   DateTime lastUpdate;

//   CurrencyRate toDomain() => CurrencyRate(
//         id: remoteId,
//         code: code,
//         rate: rate,
//         lastUpdate: lastUpdate,
//       );
// }
