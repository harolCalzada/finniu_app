import 'package:finniu/domain/datasources/onboarding_datasource.dart';
import 'package:finniu/domain/entities/onboarding_entities.dart';
import 'package:finniu/domain/entities/plan_entities.dart';
import 'package:finniu/graphql/mutations.dart';
import 'package:finniu/infrastructure/mappers/onboarding_mapper.dart';
import 'package:finniu/infrastructure/mappers/plan_mapper.dart';
import 'package:finniu/infrastructure/models/onboarding_finish_response.dart';
import 'package:finniu/infrastructure/models/onboarding_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class OnboardingDataSourceImp extends OnboardingDataSource {
  @override
  Future<OnboardingEntity> getOnboardingData({
    required GraphQLClient client,
    required String userId,
  }) async {
    final response = client.mutate(
      MutationOptions(
        document: gql(
          MutationRepository.startOnboardingQuestions(),
        ),
        variables: {
          'user_id': userId,
        },
      ),
    );
    final responseGraphQL = StartOnboardingGraphqlModel.fromJson(
      (await response).data?['startOnboarding'],
    );
    return OnboardingMapper.toEntity(responseGraphQL);
  }

  @override
  Future<OnboardingEntity> updateOnboardingData({
    required GraphQLClient client,
    required String userId,
    required String questionId,
    required String answerId,
  }) async {
    final response = await client.mutate(
      MutationOptions(
        document: gql(
          MutationRepository.startOnboardingQuestions(),
        ),
        variables: {
          'user_id': userId,
          'question_id': questionId,
          'answer_id': answerId,
        },
      ),
    );

    final responseGraphQL = StartOnboardingGraphqlModel.fromJson(
      response.data?['startOnboarding'],
    );
    return OnboardingMapper.toEntity(responseGraphQL);
  }

  @override
  Future<PlanEntity> finishOnboarding({
    required GraphQLClient client,
    required String userId,
  }) async {
    final response = await client.mutate(
      MutationOptions(
        document: gql(
          // MutationRepository.startOnboardingQuestions(),
          MutationRepository.finishOnboardingQuestions(),
        ),
        variables: {
          'user_id': userId,
        },
      ),
    );

    final responseGraphQl = FinishOnboardingResponseModel.fromJson(
      response.data!,
    );

    return PlanMapper.toEntity(responseGraphQl);
  }
}
