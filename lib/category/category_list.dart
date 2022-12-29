
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_of_library/database/database.dart';
import 'package:master_of_library/routes.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final database = Get.find<MyDatabase>();
  List<Category>  _items = <Category>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    print('_load');
    final items  = await database.select(database.categories).get();
    setState(() {
      _items.clear();
      _items  = items;
    });

  }

  addCategory() async {
    await database.into(database.categories).insert(CategoriesCompanion.insert(description: 'a'));
  }
  deleteCategory(int index) async {
    final item = _items[index];
    await database.delete(database.categories).delete(item);
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context)  {
    final length = _items.length;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Dismissible(
            key: Key(item.id.toString()),
            child: ListTile(
              title:Text(item.description),
            ),
            onDismissed: (direction) {
              deleteCategory(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(Routes.categoryAdd.name);
          print(result);
          if(result != null) {
            loadData();
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
