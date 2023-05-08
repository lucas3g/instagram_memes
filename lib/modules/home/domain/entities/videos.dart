import 'package:instagram_memes/core_module/types/entity.dart';
import 'package:instagram_memes/core_module/vos/int_vo.dart';
import 'package:instagram_memes/core_module/vos/text_vo.dart';
import 'package:result_dart/result_dart.dart';

class Videos extends Entity {
  TextVO _title;
  TextVO _pathUrl;
  IntVO _totalDownloads;

  TextVO get title => _title;
  void setTitle(String value) => _title = TextVO(value);

  TextVO get pathUrl => _pathUrl;
  void setPathUrl(String value) => _pathUrl = TextVO(value);

  IntVO get totalDownloads => _totalDownloads;
  void setTotalDownloads(int value) => _totalDownloads = IntVO(value);

  Videos({
    required super.id,
    required TextVO title,
    required TextVO pathUrl,
    required IntVO totalDownloads,
  })  : _title = title,
        _pathUrl = pathUrl,
        _totalDownloads = totalDownloads;

  @override
  Result<Videos, String> validate([Object? object]) {
    return super
        .validate()
        .flatMap(title.validate)
        .flatMap(pathUrl.validate)
        .flatMap(totalDownloads.validate)
        .pure(this);
  }
}
