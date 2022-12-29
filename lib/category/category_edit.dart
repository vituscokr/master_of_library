
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_of_library/database/database.dart';

class CategoryEditPage extends StatefulWidget {
  const CategoryEditPage({Key? key}) : super(key: key);

  @override
  State<CategoryEditPage> createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {

  final TextEditingController textEditingController = TextEditingController();
  final database = Get.find<MyDatabase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              onSubmitted: (text) {
                final text = textEditingController.text;
                if(text.isNotEmpty) {
                  _addCategory(text);
                  Get.back(result:'done');
                }
              },
            )
          ],
        )
    );
  }

  _addCategory(String desc ) async {
    await database.into(database.categories).insert(CategoriesCompanion.insert(description: desc));
  }
}
