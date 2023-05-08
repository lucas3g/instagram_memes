import 'package:instagram_memes/core_module/types/entity.dart';
import 'package:instagram_memes/core_module/vos/text_vo.dart';
import 'package:result_dart/result_dart.dart';

class Category extends Entity {
  TextVO _name;

  TextVO get name => _name;
  void setName(String value) => _name = TextVO(value);

  Category({required super.id, required TextVO name}) : _name = name;

  @override
  Result<Category, String> validate([Object? object]) {
    return super.validate().flatMap(_name.validate).pure(this);
  }
}
