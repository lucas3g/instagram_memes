import 'package:instagram_memes/core_module/types/entity.dart';
import 'package:instagram_memes/core_module/vos/int_vo.dart';
import 'package:instagram_memes/core_module/vos/text_vo.dart';
import 'package:instagram_memes/modules/home/domain/vos/category.dart';
import 'package:result_dart/result_dart.dart';

class Videos extends Entity {
  TextVO _title;
  final Category _category;
  TextVO _pathUrl;
  IntVO _totalDownloads;

  TextVO get title => _title;
  void setTitle(String value) => _title = TextVO(value);

  Category get category => _category;

  TextVO get pathUrl => _pathUrl;
  void setPathUrl(String value) => _pathUrl = TextVO(value);

  IntVO get totalDownloads => _totalDownloads;
  void setTotalDownloads(int value) => _totalDownloads = IntVO(value);

  Videos({
    required super.id,
    required TextVO title,
    required TextVO pathUrl,
    required IntVO totalDownloads,
    required Category category,
  })  : _title = title,
        _category = Category(id: category.id, name: category.name),
        _pathUrl = pathUrl,
        _totalDownloads = totalDownloads;

  @override
  Result<Videos, String> validate([Object? object]) {
    return super
        .validate()
        .flatMap(title.validate)
        .flatMap(category.validate)
        .flatMap(pathUrl.validate)
        .flatMap(totalDownloads.validate)
        .pure(this);
  }
}
