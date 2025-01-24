part of 'partner_order_cubit.dart';

class PartnerOrderState extends Equatable {
  const PartnerOrderState({
    this.partnerOrders = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<PartnerOrder> partnerOrders;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  PartnerOrderState copyWith({
    List<PartnerOrder>? customers,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return PartnerOrderState(
      partnerOrders: customers ?? this.partnerOrders,
      isLoadingShimmer: isLoadingShimmer ?? false,
      isLoadingPagination: isLoadingPagination ?? false,
      error: error,
      errorPagination: errorPagination,
    );
  }

  @override
  List<Object?> get props => [
    partnerOrders,
    isLoadingShimmer,
    isLoadingPagination,
    error,
    errorPagination,
  ];
}
