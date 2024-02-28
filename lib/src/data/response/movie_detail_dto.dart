import 'package:dmovies/src/data/response/genre_list_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_dto.g.dart';

@JsonSerializable()
class MovieDetailDto {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final BelongsToCollection? belongsToCollection;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "genres")
  final List<GenreDto>? genres;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountries>? productionCountries;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "revenue")
  final int? revenue;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguages>? spokenLanguages;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "tagline")
  final String? tagline;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "video")
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  MovieDetailDto ({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieDetailDtoToJson(this);
  }
}

@JsonSerializable()
class BelongsToCollection {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;

  BelongsToCollection ({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return _$BelongsToCollectionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BelongsToCollectionToJson(this);
  }
}

@JsonSerializable()
class ProductionCompanies {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "origin_country")
  final String? originCountry;

  ProductionCompanies ({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return _$ProductionCompaniesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductionCompaniesToJson(this);
  }
}

@JsonSerializable()
class ProductionCountries {
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  @JsonKey(name: "name")
  final String? name;

  ProductionCountries ({
    this.iso31661,
    this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return _$ProductionCountriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductionCountriesToJson(this);
  }
}

@JsonSerializable()
class SpokenLanguages {
  @JsonKey(name: "english_name")
  final String? englishName;
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  @JsonKey(name: "name")
  final String? name;

  SpokenLanguages ({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return _$SpokenLanguagesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SpokenLanguagesToJson(this);
  }
}


