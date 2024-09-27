import 'package:bloc/bloc.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../repo/shared_prefs_repo.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  final SharedPrefs sharedPrefs;
  final _auth = FirebaseAuth.instance;

  GetProductBloc({required this.sharedPrefs}) : super(GetProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(GetProductLoading());

      try {
        DatabaseReference ref = FirebaseDatabase.instance.ref(productTable);
print(sharedPrefs.getUserId());
        // Using 'once()' to get data once instead of 'listen()' to avoid continuous stream handling.
        DatabaseEvent dbEvent = await ref
            .orderByChild(userId)
            .equalTo("${sharedPrefs.getUserId()}")
            .once();

        final data = dbEvent.snapshot.value;
        print(data);


       if (data != null) {
          // Assuming data is a Map and each product has a unique key
          Map<dynamic, dynamic> productMap = data as Map<dynamic, dynamic>;
          List<Map<String, dynamic>> products = productMap.values
              .map((item) => Map<String, dynamic>.from(item))
              .toList();

          print("nnnnnnn $products");
          emit(GetProductSuccess(products: products));
        } else {
          emit(GetProductError(error: 'No products found.'));
        }

      } catch (e) {
        print("error $e");
        emit(GetProductError(error: e.toString()));
      }
    });
  }
}
