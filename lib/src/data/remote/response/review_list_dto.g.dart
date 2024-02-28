// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewListDto _$ReviewListDtoFromJson(Map<String, dynamic> json) =>
    ReviewListDto(
      id: json['id'] as int?,
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
      author: json['author'] as String?,
      authorDetails: json['author_details'] == null
          ? null
          : AuthorDetails.fromJson(
              json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as String?,
      updatedAt: json['updated_at'] as String?,
      url: json['url'] as String?,
    );

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) =>
    AuthorDetails(
      name: json['name'] as String?,
      username: json['username'] as String?,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );
