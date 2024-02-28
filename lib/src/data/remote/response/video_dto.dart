import 'package:json_annotation/json_annotation.dart';

part 'video_dto.g.dart';

@JsonSerializable(createToJson: false)
class VideoListDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "results")
  final List<VideoDto>? results;

  VideoListDto ({
    this.id,
    this.results,
  });

  factory VideoListDto.fromJson(Map<String, dynamic> json) {
    return _$VideoListDtoFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class VideoDto {
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "key")
  final String? key;
  @JsonKey(name: "site")
  final String? site;
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "official")
  final bool? official;
  @JsonKey(name: "published_at")
  final String? publishedAt;
  @JsonKey(name: "id")
  final String? id;

  VideoDto ({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory VideoDto.fromJson(Map<String, dynamic> json) {
    return _$VideoDtoFromJson(json);
  }
}


