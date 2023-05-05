import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:instagram_memes/shared/stores/app_store.dart';
import 'package:instagram_memes/utils/constants.dart';

class CardVideoWidget extends StatefulWidget {
  const CardVideoWidget({super.key});

  @override
  State<CardVideoWidget> createState() => _CardVideoWidgetState();
}

class _CardVideoWidgetState extends State<CardVideoWidget> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: appStore.themeMode.value == ThemeMode.dark
            ? context.myTheme.onPrimary
            : context.myTheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Column(
        children: [
          Expanded(child: Container()),
          Text(
            'Titulo do video',
            style: context.textTheme.bodyLarge!.copyWith(
              color: appStore.themeMode.value == ThemeMode.dark
                  ? Colors.white
                  : Colors.white,
            ),
          ),
          Divider(
            color: appStore.themeMode.value == ThemeMode.dark
                ? Colors.white
                : Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.download,
                  color: appStore.themeMode.value == ThemeMode.dark
                      ? Colors.white
                      : Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: appStore.themeMode.value == ThemeMode.dark
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
