part of 'partner_completed_history_cubit.dart';

class PartnerCompletedHistoryState extends Equatable {
  const PartnerCompletedHistoryState({
    this.partnerCompletedOrdersHistory = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<PartnerOrder> partnerCompletedOrdersHistory;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  PartnerCompletedHistoryState copyWith({
    List<PartnerOrder>? partnerCompletedOrdersHistory,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return PartnerCompletedHistoryState(
      partnerCompletedOrdersHistory: partnerCompletedOrdersHistory ?? this.partnerCompletedOrdersHistory,
      isLoadingShimmer: isLoadingShimmer ?? false,
      isLoadingPagination: isLoadingPagination ?? false,
      error: error,
      errorPagination: errorPagination,
    );
  }

  @override
  List<Object?> get props => [
    partnerCompletedOrdersHistory,
    isLoadingShimmer,
    isLoadingPagination,
    error,
    errorPagination,
  ];
}
