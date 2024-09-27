part of 'retailer_add_product_bloc.dart';

sealed class RetailerAddProductEvent extends Equatable {
  const RetailerAddProductEvent();

  @override
  List<Object> get props => [];
}
class RetailerAddProductInitialEvent  extends RetailerAddProductEvent {
 String productname,productprice,productdetail,productImage;
  RetailerAddProductInitialEvent({required this.productdetail,required this.productprice,required this.productname,required this.productImage});
}

class ValidateProduct extends RetailerAddProductEvent {

  String? productImage;
  String? productname;
  String? productprice;
  String? productdetail;

  ValidateProduct({this.productImage,this.productname,this.productdetail,this.productprice});
}
