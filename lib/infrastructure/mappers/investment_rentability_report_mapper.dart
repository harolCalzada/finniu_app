import 'package:finniu/domain/entities/investment_rentability_report_entity.dart';
import 'package:finniu/infrastructure/models/investment_rentability_report_response.dart';

class InvestmentRentabilityReportMapper {
  static InvestmentRentabilityResumeEntity graphResponseToEntity(
      UserInfoInvestmentReportResponse response) {
    final userInvestmentData = response.userInfoInvestment;
    InvestmentRentabilityResumeEntity resumeEntity =
        InvestmentRentabilityResumeEntity(
      totalAmount: userInvestmentData!.totalBalanceAmmount!.toDouble(),
      totalRentabilityAmount:
          double.parse(userInvestmentData.totalBalanceRentability!),
      totalPlans: userInvestmentData.countPlanesActive!,
    );
    final inCoursePlans = InvestmentRentabilityMapper.responseListToEntity(
        userInvestmentData.invesmentInCourse!);
    final finishedPlans = InvestmentRentabilityMapper.responseListToEntity(
        userInvestmentData.invesmentFinished!);
    resumeEntity.investmentsInCourse = inCoursePlans;
    resumeEntity.investmentsFinished = finishedPlans;
    return resumeEntity;
  }
}

class InvestmentRentabilityMapper {
  static List<InvestmentRentabilityEntity> responseListToEntity(
    List<Investment> investments,
  ) {
    return investments
        .map(
          (investment) => responseToEntity(investment),
        )
        .toList();
  }

  static InvestmentRentabilityEntity responseToEntity(Investment investment) {
    return InvestmentRentabilityEntity(
      uuid: investment.uuid!,
      planName: investment.planName,
      amount: double.parse(investment.amount!),
      createdAt: investment.createdAt!,
      isActive: investment.isActive!,
      deadLineUuid: investment.deadline!.uuid!,
      deadLineName: investment.deadline!.name!,
      deadLineValue: investment.deadline!.value!,
      statusInvestment: investment.status!,
      startDateInvestment: investment.startDateInvestment,
      endDateInvestment: investment.finishDateInvestment,
      rentabilityAmount: investment.rentabilityAmmount!.toDouble(),
      rentabilityPercent: investment.rentabilityPercent!.toDouble(),
    );
  }
}