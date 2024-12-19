part of 'customer_pagination_cubit.dart';

class CustomerPaginationState extends Equatable {
  const CustomerPaginationState({
    this.customers = const [],
    this.isLoadingShimmer = false,
    this.isLoadingPagination = false,
    this.error,
    this.errorPagination,
  });

  final List<Customer> customers;
  final bool isLoadingShimmer;
  final bool isLoadingPagination;
  final String? error;
  final String? errorPagination;

  CustomerPaginationState copyWith({
    List<Customer>? customers,
    bool? isLoadingShimmer,
    bool? isLoadingPagination,
    String? error,
    String? errorPagination,
  }) {
    return CustomerPaginationState(
      customers: customers ?? this.customers,
      isLoadingShimmer: isLoadingShimmer ?? false,
      isLoadingPagination: isLoadingPagination ?? false,
      error: error,
      errorPagination: errorPagination,
    );
  }

  @override
  List<Object?> get props => [
    customers,
    isLoadingShimmer,
    isLoadingPagination,
    error,
    errorPagination,
  ];
}
