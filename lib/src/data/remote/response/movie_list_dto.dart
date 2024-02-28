import 'package:json_annotation/json_annotation.dart';

import 'movie_dto.dart';

part 'movie_list_dto.g.dart';

@JsonSerializable()
class MovieListDto {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "results")
  final List<MovieDto>? results;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  MovieListDto ({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieListDto.fromJson(Map<String, dynamic> json) {
    return _$MovieListDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieListDtoToJson(this);
  }
}


