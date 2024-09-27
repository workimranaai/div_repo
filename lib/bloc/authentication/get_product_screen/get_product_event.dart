part of 'get_product_bloc.dart';

sealed class GetProductEvent extends Equatable {
  const GetProductEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class GetProductInitialEvent extends GetProductEvent {}

class FetchProducts extends GetProductEvent {}

