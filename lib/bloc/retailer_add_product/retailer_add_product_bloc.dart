import 'package:bloc/bloc.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../repo/shared_prefs_repo.dart';
import '../../utils/custom_strings.dart';

part 'retailer_add_product_event.dart';
part 'retailer_add_product_state.dart';

class RetailerAddProductBloc extends Bloc<RetailerAddProductEvent, RetailerAddProductState> {
  final product = FirebaseAuth.instance;
  final SharedPrefs sharedPrefs;


  RetailerAddProductBloc({required this.sharedPrefs}) : super(RetailerAddProductInitial()) {

    on<RetailerAddProductInitialEvent>((event, emit) async{
      // TODO: implement event handler
      try{
        emit(RetailerAddProductLoading());


          DatabaseReference databaseRef = FirebaseDatabase.instance.ref(productTable);
          var response = await databaseRef.push().set({
            userId: sharedPrefs.getUserId().toString(),
             productImage: event.productImage.toString().trim(),
            productName: event.productname.toString().trim(),
            productPrice: event.productprice.toString().trim(),
            productDetail: event.productdetail.toString().trim(),
          });

emit(RetailerAddProductSuccess());

      }
      catch(e){
        emit(RetailerAddProductFailure(error: e.toString()));

        print('error');
      }
    });
    on<ValidateProduct>((event, emit) {
      emit(RetailerAddProductLoading());
      if (event.productname.toString().trim().isEmpty) {
        emit(AddProductValidateInvalid(error: 'Please enter product name'));
      } else if (event.productprice.toString().trim().isEmpty) {
        emit(AddProductValidateInvalid(error: 'Please enter product price'));
      } else if (event.productdetail.toString().trim().isEmpty) {
        emit(AddProductValidateInvalid(error: 'Please select product detail'));
      } else {
        emit(AddProductValidateSuccess());
      }
    });


  }
}
