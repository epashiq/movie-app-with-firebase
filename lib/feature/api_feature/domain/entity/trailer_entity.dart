import 'package:freezed_annotation/freezed_annotation.dart';
part 'trailer_entity.freezed.dart';

@freezed
class TrailerEntity with _$TrailerEntity{
  factory TrailerEntity({
    required String type,
    required String name,
    required String key,
  })= _TrailerEntity;
}