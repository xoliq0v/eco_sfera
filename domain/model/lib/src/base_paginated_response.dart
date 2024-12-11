import 'package:core/core.dart';

class BasePaginatedResponse<T> extends Equatable {
  const BasePaginatedResponse({
    required this.content,
    required this.pagination,
  });

  final List<T> content;
  final BasePaginationResponseData pagination;

  @override
  List<Object?> get props => [
        content,
        pagination,
      ];
}

class BasePaginationResponseData extends Equatable {
  const BasePaginationResponseData({
    required this.lastPage,
    required this.currentPage,
    required this.perPage,
    required this.total,
});

  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;

  @override
  List<Object?> get props => [currentPage,perPage,total,lastPage];
}