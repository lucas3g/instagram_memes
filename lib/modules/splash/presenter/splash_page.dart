import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:instagram_memes/core_module/services/themeMode/theme_mode_controller.dart';
import 'package:instagram_memes/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    Modular.to.navigate('/home/');
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeController.themeMode;

    return Scaffold(
      backgroundColor: themeMode == ThemeMode.dark
          ? context.myTheme.onPrimary
          : context.myTheme.primary,
      body: SizedBox(
        width: context.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameApp,
              style: context.textTheme.displayMedium!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Baixe videos com fundo verde',
              style:
                  context.textTheme.titleMedium!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
