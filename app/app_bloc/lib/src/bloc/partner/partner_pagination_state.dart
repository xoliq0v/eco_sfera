

part of 'partner_pagination_cubit.dart';

class PartnerPaginationState extends Equatable {
  const PartnerPaginationState({
    this.history = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<PartnerItem> history;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  PartnerPaginationState copyWith({
    List<PartnerItem>? customers,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return PartnerPaginationState(
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
