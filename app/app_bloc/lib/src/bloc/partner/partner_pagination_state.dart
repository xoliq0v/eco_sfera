

part of 'partner_pagination_cubit.dart';

class PartnerPaginationState {
  final List<PartnerItem> history;
  final List<PartnerItem> filteredHistory;
  final String searchQuery;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  const PartnerPaginationState({
    this.history = const [],
    this.filteredHistory = const [],
    this.searchQuery = '',
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  PartnerPaginationState copyWith({
    List<PartnerItem>? history,
    List<PartnerItem>? filteredHistory,
    String? searchQuery,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return PartnerPaginationState(
      history: history ?? this.history,
      filteredHistory: filteredHistory ?? this.filteredHistory,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoadingShimmer: isLoadingShimmer ?? this.isLoadingShimmer,
      isLoadingPagination: isLoadingPagination ?? this.isLoadingPagination,
      error: error ?? this.error,
      errorPagination: errorPagination ?? this.errorPagination,
    );
  }
}