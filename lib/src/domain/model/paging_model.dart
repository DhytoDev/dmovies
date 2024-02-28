import 'package:equatable/equatable.dart';

abstract class PagingModel<T> extends Equatable {
  final int page;
  final int totalPages;
  final List<T> data;

  const PagingModel({
    this.page = 0,
    this.totalPages = 0,
    this.data = const [],
  });

  @override
  List<Object?> get props => [page, totalPages, data];
}
