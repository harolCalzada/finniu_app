import 'package:finniu/domain/entities/pre_investment.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class PreInvestmentDataSource {
  Future<PreInvestmentEntity> save({
    required GraphQLClient client,
    required int amount,
    // required String bankAccountNumber,
    required String bankAccountTypeUuid,
    required String deadLineUuid,
    required String planUuid,
  });

  Future<bool> update({
    required GraphQLClient client,
    required String uuid,
    required bool readContract,
    required String boucherScreenShot,
  });
}