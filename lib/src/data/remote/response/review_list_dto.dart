import 'package:json_annotation/json_annotation.dart';

part 'review_list_dto.g.dart';

@JsonSerializable(createToJson: false)
class ReviewListDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "results")
  final List<ReviewDto>? results;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  ReviewListDto({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory ReviewListDto.fromJson(Map<String, dynamic> json) {
    return _$ReviewListDtoFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class ReviewDto {
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "author_details")
  final AuthorDetails? authorDetails;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "url")
  final String? url;

  ReviewDto({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) {
    return _$ReviewDtoFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class AuthorDetails {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "avatar_path")
  final String? avatarPath;
  @JsonKey(name: "rating")
  final double? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return _$AuthorDetailsFromJson(json);
  }
}
