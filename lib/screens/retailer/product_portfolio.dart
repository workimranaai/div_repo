import 'package:cart_craze/bloc/retailer_add_product/retailer_add_product_bloc.dart';
import 'package:cart_craze/bloc/retailer_add_product/retailer_add_product_bloc.dart';
import 'package:cart_craze/utils/my_textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../bloc/authentication/get_product_screen/get_product_bloc.dart';
import '../../utils/global.dart';

class ProductPortfolio extends StatefulWidget {
  const ProductPortfolio({super.key});

  @override
  State<ProductPortfolio> createState() => _ProductPortfolioState();
}

class _ProductPortfolioState extends State<ProductPortfolio> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final detailController = TextEditingController();

  File? _image; // Variable to store the selected image
  final ImagePicker picker = ImagePicker();


  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path); // Store the selected image
      });
    }
    else{
      print('no image picked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: BlocListener<RetailerAddProductBloc, RetailerAddProductState>(
          listener: (context, state) {
            if (state is AddProductValidateInvalid) {
              ToastUtil.showToast(message: state.error ?? "");
            }  if (state is AddProductValidateSuccess) {
             context.read<RetailerAddProductBloc>().add(RetailerAddProductInitialEvent(productdetail: detailController.text,productImage: '',productname: nameController.text,productprice: priceController.text,));
            }
            if (state is RetailerAddProductSuccess) {
            // context.read<GetProductBloc>().add(FetchProducts());
            Navigator.pop(context);

          }
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Image upload section

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: nameController,
                  hintText: 'Product Name',
                  obscureText: false,
                ),
                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: priceController,
                  hintText: 'Price',
                  obscureText: false,
                ),
                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Detail',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: detailController,
                  hintText: 'Detail',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async{

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                GestureDetector(
                  onTap: _pickImage, // Opens the image picker
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 28.0),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),

                    child: _image != null
                        ? Image.file(_image!,
                            fit: BoxFit.cover) // Display selected image
                        : Center(
                            child: Icon(Icons.add_a_photo,
                                size: 50, color: Colors.grey),
                          ),
                  ),
                ),
                const SizedBox(height: 15),

                // Submit button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
context.read<RetailerAddProductBloc>().add(ValidateProduct(productprice: priceController.text ,
    productdetail: detailController.text,productname: nameController.text, productImage: ''));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
