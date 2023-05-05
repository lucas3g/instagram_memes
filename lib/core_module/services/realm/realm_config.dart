import 'package:instagram_memes/core_module/services/realm/model/theme_mode_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config =
    Configuration.local([ThemeModeModel.schema], initialDataCallback: (realm) {
  realm.add(ThemeModeModel('light'));
});
