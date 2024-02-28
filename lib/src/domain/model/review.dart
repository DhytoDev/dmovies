import 'package:dmovies/src/domain/model/paging_model.dart';
import 'package:equatable/equatable.dart';

class ReviewList extends PagingModel<Review> {
  const ReviewList({
    super.page,
    super.totalPages,
    super.data,
  });

  ReviewList copyWith({List<Review>? reviews}) {
    return ReviewList(
      page: page,
      data: reviews ?? data,
    );
  }
}

class Review extends Equatable {
  final String author;
  final String content;
  final String url;

  const Review({
    this.author = '',
    this.content = '',
    this.url = '',
  });

  @override
  List<Object?> get props => [author, content, url];
}
