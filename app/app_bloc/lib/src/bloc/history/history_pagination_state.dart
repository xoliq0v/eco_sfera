part of 'history_pagination_cubit.dart';

class HistoryPaginationState extends Equatable {
  const HistoryPaginationState({
    this.history = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<HistoryModel> history;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  HistoryPaginationState copyWith({
    List<HistoryModel>? customers,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return HistoryPaginationState(
      history: customers ?? this.history,
      isLoadingShimmer: isLoadingShimmer ?? false,
      isLoadingPagination: isLoadingPagination ?? false,
      error: error,
      errorPagination: errorPagination,
    );
  }

  @override
  List<Object?> get props => [
    history,
    isLoadingShimmer,
    isLoadingPagination,
    error,
    errorPagination,
  ];
}
