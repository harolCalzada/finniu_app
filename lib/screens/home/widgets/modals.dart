import 'package:finniu/constants/colors.dart';
import 'package:finniu/providers/settings_provider.dart';
import 'package:finniu/services/share_preferences_service.dart';
import 'package:finniu/widgets/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

void showSettingsDialog(BuildContext ctx) {
  final themeProvider = Provider.of<SettingsProvider>(ctx, listen: false);
  showDialog(
    context: ctx,
    builder: (ctx) => Dialog(
      insetAnimationDuration: const Duration(seconds: 1),
      insetAnimationCurve: Curves.easeInOutCubic,
      backgroundColor: themeProvider.isDarkMode ? const Color(primaryDark) : const Color(secondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(ctx).size.width * 0.9,
        height: 525,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 23,
                  width: 23,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkMode ? const Color(primaryLight) : const Color(primaryDark),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: InkWell(
                    child: Icon(
                      size: 17,
                      Icons.close,
                      color: themeProvider.isDarkMode ? const Color(primaryDark) : const Color(primaryLight),
                    ),
                    onTap: () {
                      Navigator.of(ctx).pop();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/home/avatar.png"),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Mari",
                              style: TextStyle(height: 1.5, fontSize: 16, color: themeProvider.isDarkMode ? Colors.white : Colors.black, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            TextPoppins(
                                text: 'Light mode',
                                colorText: themeProvider.isDarkMode ? Colors.white.value : Colors.black.value,
                                // colorText: ,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                            const SizedBox(width: 5),
                            FlutterSwitch(
                              width: 29,
                              height: 16,
                              value: Preferences.isDarkMode,
                              inactiveColor: const Color(primaryDark),
                              activeColor: const Color(primaryLight),
                              inactiveToggleColor: const Color(primaryLight),
                              activeToggleColor: const Color(primaryDark),
                              onToggle: (value) {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "MarianaCPolo@gmail.com",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 12,
                                color: themeProvider.isDarkMode ? const Color(primaryLight) : const Color(grayText1),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "S/4050",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Total invertido",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          color: themeProvider.isDarkMode ? const Color(primaryLight) : const Color(primaryDark),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 2,
                    color: themeProvider.isDarkMode ? const Color(primaryLight) : const Color(primaryDark),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "2",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Planes invertidos",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          color: themeProvider.isDarkMode ? const Color(primaryLight) : const Color(primaryDark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ItemSetting(
                      icon: Icons.person_outlined,
                      text: "Mi perfil",
                      onTap: () {
                        Navigator.of(ctx).pushNamed('/profile');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemSetting(
                      icon: Icons.privacy_tip_outlined,
                      text: "Privacidad",
                      onTap: () {
                        Navigator.of(ctx).pushNamed('/privacy');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemSetting(
                      icon: Icons.model_training,
                      text: "Mis transferencias",
                      onTap: () {
                        Navigator.of(ctx).pushNamed('/transfers');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemSetting(
                      icon: Icons.g_translate_outlined,
                      text: "Lenguajes",
                      onTap: () {
                        Navigator.of(ctx).pushNamed('/languages');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemSetting(icon: Icons.help_outline, text: "Ayuda"),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemSetting(
                      icon: Icons.logout,
                      text: "Cerrar sesión",
                      onTap: () {
                        Navigator.of(ctx).pushNamedAndRemoveUntil('/login_start', (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ItemSetting extends StatelessWidget {
  late IconData _icon;
  late String _text;
  Function? _onTap;

  ItemSetting({
    required IconData icon,
    required String text,
    Function? onTap,
  }) {
    _icon = icon;
    _text = text;
    _onTap = onTap;
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider themeProvider = Provider.of<SettingsProvider>(context);
    return Row(
      children: [
        Container(
          width: 46,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeProvider.isDarkMode ? const Color(primaryLight) : const Color(primaryDark),
          ),
          child: InkWell(
            child: Icon(
              _icon,
              color: themeProvider.isDarkMode ? const Color(primaryDark) : const Color(primaryLight),
            ),
            onTap: _onTap as void Function()?,
          ),
        ),
        const SizedBox(width: 10),
        Text(_text),
      ],
    );
  }
}

void showWelcomeModal(BuildContext ctx) {
  final themeProvider = Provider.of<SettingsProvider>(ctx, listen: false);
  Future.delayed(
    const Duration(seconds: 1),
    () async {
      showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
        ),
        elevation: 10,
        backgroundColor: themeProvider.isDarkMode ? const Color(primaryDark) : const Color(primaryLight),
        context: ctx,
        builder: (ctx) => SizedBox(
          height: MediaQuery.of(ctx).size.height * 0.90,
          // height:\
          //     width: MediaQuery.of(context).size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 182,
                    height: 185,
                    child: Image.asset('assets/home/modal_info.png'),
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: themeProvider.isDarkMode ? Colors.white : const Color(primaryDark),
                        ),
                        "Hola Mari,recuerda que es muy importante tener todos tus datos completos en la sección Editar perfil para que puedas realizar tu inversión con éxito."),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 132,
                        height: 46,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              themeProvider.isDarkMode ? const Color(primaryDarkAlternative) : const Color(0XFF68C3DE),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(ctx);
                            Preferences.showWelcomeModal = false;
                            themeProvider.setShowWelcomeModal(false);
                          },
                          child: Text(
                            "Saltar",
                            style: TextStyle(
                              color: themeProvider.isDarkMode ? Colors.white : const Color(primaryDark),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 132,
                        height: 46,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              themeProvider.isDarkMode ? const Color(buttonBackgroundColorDark) : const Color(primaryDark),
                            ),
                          ),
                          onPressed: () {
                            Preferences.showWelcomeModal = false;
                            themeProvider.setShowWelcomeModal(false);
                            Navigator.of(ctx).pushNamed('/profile');
                          },
                          child: Text(
                            "Completar",
                            style: TextStyle(
                              color: themeProvider.isDarkMode ? const Color(primaryDark) : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
