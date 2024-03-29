import 'package:finniu/constants/colors.dart';
import 'package:finniu/presentation/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCheckBox extends StatefulHookConsumerWidget {
  final initialValueState;
  final CallbackAction? callback;
  const CustomCheckBox(
      {super.key, required this.initialValueState, this.callback});

  @override
  ConsumerState<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends ConsumerState<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(settingsNotifierProvider);
    Color getColor(Set<MaterialState> states) {
      return currentTheme.isDarkMode
          ? const Color(primaryLight)
          : const Color(primaryDark);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.initialValueState.value = isChecked;
        });
      },
    );
  }
}
