import 'package:flutter_modular/flutter_modular.dart';
import 'package:instagram_memes/core_module/core_module.dart';
import 'package:instagram_memes/core_module/services/realm/realm_config.dart';
import 'package:instagram_memes/core_module/services/themeMode/theme_mode_service.dart';
import 'package:instagram_memes/modules/home/home_module.dart';
import 'package:instagram_memes/modules/splash/splash_module.dart';
import 'package:instagram_memes/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    SplashModule(),
    HomeModule(),
  ];

  @override
  final List<Bind> binds = [
    //REALM
    Bind.instance<Realm>(Realm(config)),

    //STORES
    Bind.singleton<AppStore>((i) => AppStore(i())),

    //THEME MODE
    Bind.factory<IThemeMode>((i) => ThemeModeService(realm: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
