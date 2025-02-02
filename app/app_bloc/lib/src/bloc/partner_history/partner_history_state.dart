part of 'partner_history_cubit.dart';

class PartnerHistoryState extends Equatable {
  const PartnerHistoryState({
    this.partnerOrdersHistory = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<PartnerOrder> partnerOrdersHistory;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  PartnerHistoryState copyWith({
    List<PartnerOrder>? partnerOrdersHistory,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return PartnerHistoryState(
      partnerOrdersHistory: partnerOrdersHistory ?? this.partnerOrdersHistory,
      isLoadingShimmer: isLoadingShimmer ?? false,
      isLoadingPagination: isLoadingPagination ?? false,
      error: error,
      errorPagination: errorPagination,
    );
  }

  @override
  List<Object?> get props => [
    partnerOrdersHistory,
    isLoadingShimmer,
    isLoadingPagination,
    error,
    errorPagination,
  ];
}
