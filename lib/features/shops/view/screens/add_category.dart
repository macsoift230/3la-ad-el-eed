import 'package:_3la_ad_el_eed/features/shops/view/widgets/cust_form_field.dart';
import 'package:flutter/material.dart';

class AddCategories extends StatelessWidget {
  AddCategories({super.key});
  String? categoryName;
  String? describtion;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onSaved: (val){
                      categoryName = val;
                    },
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
                    onSaved: (val){
                      describtion = val;
                    },
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
                  CustFormField(
                    color: Colors.grey[200],
                    hint: "Meta tags",
                    borderColor: Colors.grey[200],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required adding additional information";
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          print (categoryName);
                          print(describtion);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
