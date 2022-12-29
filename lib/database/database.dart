import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import './table.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/books.sqlite');
    return NativeDatabase(file);
  });
}

@DriftDatabase(
    tables: [
      Books, Categories
    ])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

// Future<int> addBooks(BooksCompanion entry) {
//   return into(books).insert(entry);
// }
// Future delBook(data) {
//   return delete(books).delete(data);
// }
//
// Future<List<Books>> get allItems => select(books).get();
//
// Future<List<Categories>> get allCategories => select(categories).get();

}