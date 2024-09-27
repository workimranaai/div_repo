part of 'get_product_bloc.dart';

sealed class GetProductState extends Equatable {
  const GetProductState();
  @override
  List<Object> get props => [];
}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}
final class GetProductSuccess extends GetProductState {
  final List<Map<String, dynamic>> products;

  const GetProductSuccess({required this.products});
}
final class GetProductError extends GetProductState {
  final String error;
  GetProductError({required this.error});
}
