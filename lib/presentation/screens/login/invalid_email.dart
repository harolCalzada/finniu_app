import 'package:finniu/presentation/providers/settings_provider.dart';
import 'package:finniu/widgets/fonts.dart';
import 'package:finniu/widgets/scaffold.dart';
import 'package:finniu/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:finniu/constants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InvalidEmail extends ConsumerWidget {
  const InvalidEmail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(settingsNotifierProvider);
    // final currentTheme = Provider.of<SettingsProvider>(context, listen: false);

    return CustomScaffoldReturn(
        body: Center(
            child: Column(children: <Widget>[
      const SizedBox(height: 90),
      TextPoppins(
        text: 'Correo inválido',
        colorText: Theme.of(context).textTheme.titleLarge!.color!.value,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      const SizedBox(height: 10),
      const TextPoppins(
        text: 'Este correo no está registrado en el App',
        colorText: grayText,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      const SizedBox(height: 25),
      Stack(children: <Widget>[
        SizedBox(
          width: 125,
          height: 103,
          child: Image.asset('assets/forgotpassword/sad.png'),
        ),
      ]),
      const SizedBox(height: 40),
      const SizedBox(
        width: 224,
        height: 38,
        child: ButtonDecoration(
          textHint: 'Correo inválido',
          textLabel: 'Correo electrónico',
        ),
      ),
      const SizedBox(height: 15),
      Center(
          child: TextPoppins(
        text: '¿Aún no tienes una cuenta creada?',
        colorText: currentTheme.isDarkMode ? whiteText : blackText,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      )),
      const SizedBox(height: 2),
      Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/login_email');
          },
          child: TextPoppins(
            text: 'Registrarme',
            colorText: currentTheme.isDarkMode ? primaryLight : primaryDark,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ])));
  }
}
