part of 'retailer_add_product_bloc.dart';

sealed class RetailerAddProductState extends Equatable {
  const RetailerAddProductState();

  @override
  List<Object> get props => [];
}

final class RetailerAddProductInitial extends RetailerAddProductState {}

final class RetailerAddProductLoading extends RetailerAddProductState {}

final class RetailerAddProductSuccess extends RetailerAddProductState {}

final class RetailerAddProductFailure extends RetailerAddProductState {
  final String error;
  RetailerAddProductFailure({required this.error});
}

final class RetailerAddProductValidate extends RetailerAddProductState {

}
final class AddProductValidateInvalid extends RetailerAddProductState {
   String error;
  AddProductValidateInvalid({required this.error});
}
final class AddProductValidateSuccess extends RetailerAddProductState {
  AddProductValidateSuccess();
}