

part of 'active_history_pagination_cubit.dart';

class ActiveHistoryPaginationState extends Equatable {
  const ActiveHistoryPaginationState({
    this.history = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<ActiveHistory> history;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  ActiveHistoryPaginationState copyWith({
    List<ActiveHistory>? customers,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return ActiveHistoryPaginationState(
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
