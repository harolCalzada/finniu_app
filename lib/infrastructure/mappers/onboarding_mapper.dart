import 'package:finniu/domain/entities/onboarding_entities.dart';
import 'package:finniu/domain/entities/plan_entities.dart';
import 'package:finniu/infrastructure/models/onboarding_finish_response.dart';
import 'package:finniu/infrastructure/models/onboarding_response.dart';

class OnboardingMapper {
  static OnboardingEntity toEntity(StartOnboardingGraphqlModel model) {
    return OnboardingEntity(
      totalQuestions: model.totalQuestions ?? 0,
      totalCompletedQuestions: model.questionsCompleted ?? 0,
      questions: model.questions!
          .map(
            (e) => OnboardingQuestionEntity(
              text: e.text ?? '',
              uuid: e.uuid ?? '',
              questionImageUrl: e.questionImageUrl ?? '',
              answers: e.answers!
                  .map(
                    (e) => AnswerEntity(
                      text: e.text ?? '',
                      uuid: e.uuid ?? '',
                      value: e.value ?? 0,
                    ),
                  )
                  .toList(),
              value: '',
            ),
          )
          .toList(),
    );
  }
}

class PlanMapper {
  static PlanEntity toEntity(FinishOnboardingResponseModel finishResponse) {
    final planModel = finishResponse.finishOnboarding?.plan;
    print('plan model!!!!!!!!');
    print(planModel?.name);
    print(planModel?.minAmount);
    print(planModel?.value);
    print(planModel?.twelveMonthsReturn);
    return PlanEntity(
      uuid: planModel?.uuid ?? '',
      name: planModel?.name ?? '',
      minAmount: double.parse(planModel?.minAmount ?? '0'),
      value: planModel?.value?.toDouble() ?? 0,
      twelveMonthsReturn: double.parse(planModel?.twelveMonthsReturn ?? '0'),
      sixMonthsReturn: double.parse(planModel?.sixMonthsReturn ?? '0'),
      description: planModel?.description ?? '',
    );
  }
}
