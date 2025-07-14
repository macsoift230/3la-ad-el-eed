import 'package:_3la_ad_el_eed/features/shops/view/controllers/image_picker_provider.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/categories.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/cust_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  String? categoryName;
  String? describtion;
  File? image;
  ImagePickerWidget imagePickerWidget = ImagePickerWidget();
  GlobalKey<FormState> formkey = GlobalKey();

  CollectionReference categories = FirebaseFirestore.instance.collection('categories');



  Future<void> addCat() {
    // Call the user's CollectionReference to add a new user
    return categories
        .add({
      'Name': nameController.text, // John Doe
      'Description': describtionController.text, // Stokes and Sons
    })
        .then((value) => print("Category Added"))
        .catchError((error) => print("Failed to add Category: $error"));

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => ImagePickerWidget(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Category",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.close, size: 30),
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    CustFormField(
                      controller: nameController,
                      color: Colors.grey[200],
                      hint: "Category Name",
                      borderColor: Colors.grey[200],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required adding additional information";
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    CustFormField(
                      controller: describtionController,
                      color: Colors.grey[200],
                      hint: "Category Describtion ",
                      borderColor: Colors.grey[200],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required adding additional information";
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Consumer<ImagePickerWidget>(
                            builder: (context, imageProvider, child) {
                              return Container(
                                color: Colors.grey[200],
                                height: 200,
                                child:
                                imageProvider.image != null
                                    ? Image.file(
                                  imageProvider.image!,
                                  fit: BoxFit.cover,
                                )
                                    : Icon(
                                  Icons.image,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              //Camera Pic Button
                              Selector<ImagePickerWidget , File?>(
                                selector: (context ,cameraImage) => image,
                                builder: (context, imageProvider, child) {
                                  return Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        imageProvider;
                                      },
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Camera \n pic',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 15),
                              Selector<ImagePickerWidget , File?>(
                                  selector: (context , galleryImage) => image,
                                  builder: (context,imageProvider,child){
                                    return Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          imageProvider;
                                        },
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Browse \n pic',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    );
                                  } )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFF9BA8C),
                      ),
                      child: MaterialButton(
                        child: Text(
                          "Add Category",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          addCat();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Categories()),
                          );

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

