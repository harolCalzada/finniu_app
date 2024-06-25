import 'package:finniu/domain/entities/dead_line.dart';
import 'package:finniu/domain/entities/user_bank_account_entity.dart';
import 'package:finniu/infrastructure/models/investment/investment_form_data.dart';
import 'package:finniu/infrastructure/models/re_investment/input_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormNotifier extends StateNotifier<InvestmentFormData> {
  FormNotifier()
      : super(
          InvestmentFormData(
            amount: 0,
            bankAccount: null,
            deadline: null,
            originFounds: null,
            uuidPlan: '',
            currency: '',
            coupon: '',
          ),
        );

  void updateAmount(int amount) {
    state = state.copyWith(amount: amount);
  }

  void updateUuidBank(BankAccount? bankAccount) {
    state = state.copyWith(bankAccount: bankAccount);
  }

  void updateDeadline(DeadLineEntity? deadline) {
    state = state.copyWith(deadline: deadline);
  }

  void updateUuidPlan(String uuidPlan) {
    state = state.copyWith(uuidPlan: uuidPlan);
  }

  void updateCurrency(String currency) {
    state = state.copyWith(currency: currency);
  }

  void updateCoupon(String coupon) {
    state = state.copyWith(coupon: coupon);
  }

  void updateOriginFounds(OriginFunds? originFounds) {
    state = state.copyWith(originFounds: originFounds);
  }
}

final formNotifierProvider =
    StateNotifierProvider<FormNotifier, InvestmentFormData>((ref) {
  return FormNotifier();
});