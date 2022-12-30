import './database.dart';
import 'package:drift/drift.dart';


class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get category => integer().nullable()();


  TextColumn get title => text()();
  TextColumn get link => text()();
  TextColumn get image => text()();
  TextColumn get author => text()();
  TextColumn get discount => text()();
  TextColumn get publisher => text()();
  TextColumn get pubdate => text()();
  TextColumn get description => text()();

  DateTimeColumn get wdate => dateTime()();
  DateTimeColumn get udate => dateTime()();


  TextColumn get etc1 => text()();
  TextColumn get etc2 => text()();
  TextColumn get etc3 => text()();
  TextColumn get etc4 => text()();
  TextColumn get etc5 => text()();


}



@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

@DataClassName('Tag')
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}


@DataClassName('BookTag')
class BookTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer()();
  IntColumn get tagId => integer()();
}

@DataClassName('Comment')
class Memos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer()();
  TextColumn get content => text()();
  TextColumn get user => text()();
  DateTimeColumn get wdate => dateTime()();
  DateTimeColumn get udate => dateTime()();

  TextColumn get etc1 => text()();
  TextColumn get etc2 => text()();
  TextColumn get etc3 => text()();
  TextColumn get etc4 => text()();
  TextColumn get etc5 => text()();

}

@DataClassName('Settings')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
}
