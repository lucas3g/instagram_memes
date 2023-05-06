import 'package:flutter/material.dart';
import 'package:instagram_memes/core_module/services/themeMode/theme_mode_controller.dart';
import 'package:instagram_memes/modules/home/presenter/widgets/card_videos_widget.dart';
import 'package:instagram_memes/shared/components/my_input_widget.dart';
import 'package:instagram_memes/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appStore = ThemeModeController.appStore;

    return Scaffold(
      appBar: AppBar(
        title: const Text(nameApp),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kBorderRadius),
            bottomRight: Radius.circular(kBorderRadius),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            appStore.changeThemeMode(
              appStore.themeMode.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          icon: Icon(
            appStore.themeMode.value == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            const MyInputWidget(
              label: 'Pesquisar',
              hintText: 'Digite o título do video',
            ),
            const Divider(),
            Text(
              'Lista de Videos',
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CardVideoWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
