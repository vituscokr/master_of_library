import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:master_of_library/books/books_list.dart';
import 'package:master_of_library/category/category_edit.dart';
import 'package:master_of_library/category/category_list.dart';

enum Routes {
  categoryList(
      'categoryList',
      '/category_list' ,
      CategoryListPage()
  ),
  categoryAdd(
      'categoryAdd',
      '/category_edit',
      CategoryEditPage()
  ),
  booksList(
      'booksList',
      '/books_list',
      BooksListPage()
  ),
  booksSearch(
      'booksSearch',
      '/books_search',
      BooksListPage()
  ),


  undefined('default','/', null);
  const Routes(
      this.code,
      this.name,
      this.page,
      );
  final String code;
  final String name;
  final Widget? page;

  factory Routes.getByCode(String code) {
    return Routes.values.firstWhere((element) => element.code == code ,
        orElse: () => Routes.undefined);
  }
}

List<GetPage> routes = List.generate(Routes.values.length, (index) {
  var route = Routes.values[index];
  var page = route.page;
  if (page == null) {
    return GetPage(
      name: route.name,
      page: () => const SizedBox(height:0),
    );
  } else {
    return GetPage(name: route.name, page: () => page);
  }
});