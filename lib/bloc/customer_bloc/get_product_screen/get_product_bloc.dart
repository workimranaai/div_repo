import 'package:bloc/bloc.dart';
import 'package:cart_craze/repo/shared_prefs_repo.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'get_product_event.dart';

part 'get_product_state.dart';

class GetProductsBloc extends Bloc<GetProductEvent, GetProductState> {
  SharedPrefs sharedPrefs;

  GetProductsBloc({required this.sharedPrefs}) : super(GetProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      try {
        DatabaseReference ref = FirebaseDatabase.instance.ref(productTable);
        var event = await ref
            .orderByChild(userId)
            .equalTo("${sharedPrefs.getUserId()}")
            .onValue
            .listen((DatabaseEvent event) {
          final data = event.snapshot.value;
          print(data);

          if (data != null) {
            // Assuming data is a Map and each product has a unique key
            Map<dynamic, dynamic> productMap = data as Map<dynamic, dynamic>;
            List<Map<String, dynamic>> products = productMap.values
                .map((item) => Map<String, dynamic>.from(item))
                .toList();

            // Emit success state with the list of products
            emit(GetProductSuccess(products: products));
          } else {
            emit(GetProductError(error: 'No products found.'));
          }
        });

      } catch (e) {
        emit(GetProductError(error: e.toString()));
      }
    });
  }
}
