import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/account_metadata_local_model.dart';

class AccountMetadataLocalDataSource {
  AccountMetadataLocalDataSource({required Box<AccountMetadataLocalModel> box})
    : _box = box;
  final Box<AccountMetadataLocalModel> _box;

  IOEither<ExceptionWithStackTrace, AccountMetadataLocalModel> store({
    required String label,
    required String iconUri,
    required int backgroundColor,
    required Uint8List accountAddress,
  }) => IOEither<ExceptionWithStackTrace, AccountMetadataLocalModel>(() {
    if (label.trim().isEmpty) {
      throw ArgumentError.value(
        label,
        'label',
        'Account label cannot be empty',
      );
    }
    if (iconUri.trim().isEmpty) {
      throw ArgumentError.value(
        iconUri,
        'iconUri',
        'Account icon URI cannot be empty',
      );
    }
    if (backgroundColor < 0 || backgroundColor > 0xFFFFFFFF) {
      throw ArgumentError.value(
        backgroundColor,
        'backgroundColor',
        'Background color must be a valid ARGB color value (0x00000000 to 0xFFFFFFFF)',
      );
    }
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
      existingAddressResult =
          getByAddress(accountAddress: accountAddress).run();

      if (existingAddressResult.isLeft()) {
        return left(existingAddressResult.getLeft().toNullable()!);
      }
      if (existingAddressResult.isRight() &&
          existingAddressResult.getRight().isSome() &&
          existingAddressResult.getRight().toNullable()!.isSome()) {
        throw StateError('Account with this address already exists');
      }

      final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
      existingLabelResult = getByLabel(label: label).run();

      if (existingLabelResult.isLeft()) {
        return left(existingLabelResult.getLeft().toNullable()!);
      }
      if (existingLabelResult.isRight() &&
          existingLabelResult.getRight().isSome() &&
          existingLabelResult.getRight().toNullable()!.isSome()) {
        throw StateError('Account with label "$label" already exists');
      }

      final AccountMetadataLocalModel model = AccountMetadataLocalModel(
        label: label.trim(),
        iconUri: iconUri.trim(),
        backgroundColor: backgroundColor,
        accountAddress: accountAddress,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored account metadata: $model');
      return right(model);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
  getByAddress({required Uint8List accountAddress}) =>
      IOEither<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>(() {
        if (accountAddress.length != 32) {
          throw ArgumentError.value(
            accountAddress,
            'accountAddress',
            'Account address must be exactly 32 bytes in length',
          );
        }

        try {
          final AccountMetadataLocalModel? metadata =
              _box
                  .query(
                    AccountMetadataLocalModel_.accountAddress.equals(
                      accountAddress,
                    ),
                  )
                  .build()
                  .findFirst();
          return right(optionOf(metadata));
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
  getByLabel({required String label}) =>
      IOEither<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>(() {
        if (label.trim().isEmpty) {
          throw ArgumentError.value(
            label,
            'label',
            'Account label cannot be empty',
          );
        }

        try {
          final AccountMetadataLocalModel? metadata =
              _box
                  .query(AccountMetadataLocalModel_.label.equals(label))
                  .build()
                  .findFirst();
          return right(optionOf(metadata));
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>> get({
    required int localId,
  }) =>
      IOEither<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>(() {
        if (localId <= 0) {
          throw ArgumentError.value(
            localId,
            'localId',
            'Local ID must be a positive integer',
          );
        }

        try {
          final AccountMetadataLocalModel? metadata = _box.get(localId);
          return right(optionOf(metadata));
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Set<AccountMetadataLocalModel>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<AccountMetadataLocalModel>>(() {
        try {
          return right(_box.getAll().toSet());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> delete({required int localId}) =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        if (localId <= 0) {
          throw ArgumentError.value(
            localId,
            'localId',
            'Local ID must be a positive integer',
          );
        }

        try {
          final bool success = _box.remove(localId);
          if (!success) {
            throw StateError('Account with local ID: $localId not found');
          }
          AppLogger.debug('Deleted account with ID: $localId');
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> deleteByAddress({
    required Uint8List accountAddress,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (accountAddress.length != 32) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address must be exactly 32 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
      metadataResult = getByAddress(accountAddress: accountAddress).run();

      return metadataResult.fold(
        left,
        (Option<AccountMetadataLocalModel> metadataOption) =>
            metadataOption.fold(
              () =>
                  throw StateError(
                    'Account not found with the specified address',
                  ),
              (AccountMetadataLocalModel metadata) =>
                  delete(localId: metadata.localId).run(),
            ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByLabel({
    required String label,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (label.trim().isEmpty) {
      throw ArgumentError.value(
        label,
        'label',
        'Account label cannot be empty',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
      metadataResult = getByLabel(label: label).run();

      return metadataResult.fold(
        left,
        (Option<AccountMetadataLocalModel> metadataOption) =>
            metadataOption.fold(
              () => throw StateError('Account not found with label: $label'),
              (AccountMetadataLocalModel metadata) =>
                  delete(localId: metadata.localId).run(),
            ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<int> localIds,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (localIds.isEmpty) {
      throw ArgumentError.value(
        localIds,
        'localIds',
        'List of IDs cannot be empty',
      );
    }

    for (final int id in localIds) {
      if (id <= 0) {
        throw ArgumentError.value(
          id,
          'localId',
          'Each local ID must be a positive integer',
        );
      }
    }

    try {
      final List<AccountMetadataLocalModel?> existingObjects = _box.getMany(
        localIds.toList(),
      );

      final Set<int> existingIds =
          existingObjects
              .map((AccountMetadataLocalModel? obj) => obj?.localId ?? 0)
              .toSet();

      final Set<int> missingIds = localIds.difference(existingIds);

      if (missingIds.isNotEmpty) {
        throw StateError(
          'Accounts not found with the following IDs: $missingIds',
        );
      }

      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified accounts: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted multiple accounts: $localIds');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> clear() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _box.removeAll();
          AppLogger.debug('Cleared all accounts');
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, int> count() =>
      IOEither<ExceptionWithStackTrace, int>(() {
        try {
          return right(_box.count());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
  IOEither<ExceptionWithStackTrace, Unit> update({
    required int localId,
    Option<String> label = const None(),
    Option<String> iconUri = const None(),
    Option<int> backgroundColor = const None(),
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    label.fold(
      () => null, // No validation needed if None
      (String labelValue) {
        if (labelValue.trim().isEmpty) {
          throw ArgumentError.value(
            labelValue,
            'label',
            'Account label cannot be empty',
          );
        }
      },
    );

    iconUri.fold(
      () => null, // No validation needed if None
      (String iconUriValue) {
        if (iconUriValue.trim().isEmpty) {
          throw ArgumentError.value(
            iconUriValue,
            'iconUri',
            'Account icon URI cannot be empty',
          );
        }
      },
    );

    backgroundColor.fold(() => null, (int bgColor) {
      if (bgColor < 0 || bgColor > 0xFFFFFFFF) {
        throw ArgumentError.value(
          bgColor,
          'backgroundColor',
          'Background color must be a valid ARGB color value (0x00000000 to 0xFFFFFFFF)',
        );
      }
    });

    try {
      return get(localId: localId).run().flatMap(
        (
          Option<AccountMetadataLocalModel> existingOption,
        ) => existingOption.fold(
          () => throw StateError('Account with local ID: $localId not found'),
          (AccountMetadataLocalModel existing) => label.fold(
            () =>
                _updateAccountInBox(existing, label, iconUri, backgroundColor),
            (String labelValue) {
              if (labelValue != existing.label) {
                return getByLabel(label: labelValue).run().flatMap(
                  (Option<AccountMetadataLocalModel> existingLabelOption) =>
                      existingLabelOption.fold(
                        () => _updateAccountInBox(
                          existing,
                          label,
                          iconUri,
                          backgroundColor,
                        ),
                        (AccountMetadataLocalModel existingLabel) =>
                            existingLabel.localId != localId
                                ? throw StateError('Label already exists')
                                : _updateAccountInBox(
                                  existing,
                                  label,
                                  iconUri,
                                  backgroundColor,
                                ),
                      ),
                );
              }
              return _updateAccountInBox(
                existing,
                label,
                iconUri,
                backgroundColor,
              );
            },
          ),
        ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  Either<ExceptionWithStackTrace, Unit> _updateAccountInBox(
    AccountMetadataLocalModel existing,
    Option<String> label,
    Option<String> iconUri,
    Option<int> backgroundColor,
  ) {
    try {
      final AccountMetadataLocalModel updated = AccountMetadataLocalModel(
        label: label.getOrElse(() => existing.label),
        iconUri: iconUri.getOrElse(() => existing.iconUri),
        backgroundColor: backgroundColor.getOrElse(
          () => existing.backgroundColor,
        ),
        accountAddress: existing.accountAddress,
      );

      _box.put(updated, mode: PutMode.update);
      AppLogger.debug('Updated account with ID: ${existing.localId}');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  }
}