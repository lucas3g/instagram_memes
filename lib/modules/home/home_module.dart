import 'package:flutter_modular/flutter_modular.dart';
import 'package:instagram_memes/modules/home/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind<Object>> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => const HomePage()),
    ),
  ];
}
