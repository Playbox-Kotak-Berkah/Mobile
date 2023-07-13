import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/add_product_controller.dart';

class AddProductPage extends GetView<AddProductController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AddProductPage')),
      body: SafeArea(
        child: Text('AddProductController'),
      ),
    );
  }
}
