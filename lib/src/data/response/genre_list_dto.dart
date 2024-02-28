import 'package:json_annotation/json_annotation.dart';

part 'genre_list_dto.g.dart';

@JsonSerializable()
class GenreListDto {
  final List<GenreDto> genres;

  GenreListDto({required this.genres});

  factory GenreListDto.fromJson(Map<String, dynamic> json) => _$GenreListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListDtoToJson(this);
}

@JsonSerializable()
class GenreDto {
  final int id;
  final String name;

  GenreDto({required this.id, required this.name});

  factory GenreDto.fromJson(Map<String, dynamic> json) => _$GenreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);
}

