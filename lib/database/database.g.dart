// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Book extends DataClass implements Insertable<Book> {
  final int id;
  final int? category;
  final String title;
  final String link;
  final String image;
  final String author;
  final String discount;
  final String publisher;
  final String pubdate;
  final String description;
  final DateTime wdate;
  final DateTime udate;
  final String etc1;
  final String etc2;
  final String etc3;
  final String etc4;
  final String etc5;
  const Book(
      {required this.id,
      this.category,
      required this.title,
      required this.link,
      required this.image,
      required this.author,
      required this.discount,
      required this.publisher,
      required this.pubdate,
      required this.description,
      required this.wdate,
      required this.udate,
      required this.etc1,
      required this.etc2,
      required this.etc3,
      required this.etc4,
      required this.etc5});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    map['title'] = Variable<String>(title);
    map['link'] = Variable<String>(link);
    map['image'] = Variable<String>(image);
    map['author'] = Variable<String>(author);
    map['discount'] = Variable<String>(discount);
    map['publisher'] = Variable<String>(publisher);
    map['pubdate'] = Variable<String>(pubdate);
    map['description'] = Variable<String>(description);
    map['wdate'] = Variable<DateTime>(wdate);
    map['udate'] = Variable<DateTime>(udate);
    map['etc1'] = Variable<String>(etc1);
    map['etc2'] = Variable<String>(etc2);
    map['etc3'] = Variable<String>(etc3);
    map['etc4'] = Variable<String>(etc4);
    map['etc5'] = Variable<String>(etc5);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      title: Value(title),
      link: Value(link),
      image: Value(image),
      author: Value(author),
      discount: Value(discount),
      publisher: Value(publisher),
      pubdate: Value(pubdate),
      description: Value(description),
      wdate: Value(wdate),
      udate: Value(udate),
      etc1: Value(etc1),
      etc2: Value(etc2),
      etc3: Value(etc3),
      etc4: Value(etc4),
      etc5: Value(etc5),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<int?>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      link: serializer.fromJson<String>(json['link']),
      image: serializer.fromJson<String>(json['image']),
      author: serializer.fromJson<String>(json['author']),
      discount: serializer.fromJson<String>(json['discount']),
      publisher: serializer.fromJson<String>(json['publisher']),
      pubdate: serializer.fromJson<String>(json['pubdate']),
      description: serializer.fromJson<String>(json['description']),
      wdate: serializer.fromJson<DateTime>(json['wdate']),
      udate: serializer.fromJson<DateTime>(json['udate']),
      etc1: serializer.fromJson<String>(json['etc1']),
      etc2: serializer.fromJson<String>(json['etc2']),
      etc3: serializer.fromJson<String>(json['etc3']),
      etc4: serializer.fromJson<String>(json['etc4']),
      etc5: serializer.fromJson<String>(json['etc5']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<int?>(category),
      'title': serializer.toJson<String>(title),
      'link': serializer.toJson<String>(link),
      'image': serializer.toJson<String>(image),
      'author': serializer.toJson<String>(author),
      'discount': serializer.toJson<String>(discount),
      'publisher': serializer.toJson<String>(publisher),
      'pubdate': serializer.toJson<String>(pubdate),
      'description': serializer.toJson<String>(description),
      'wdate': serializer.toJson<DateTime>(wdate),
      'udate': serializer.toJson<DateTime>(udate),
      'etc1': serializer.toJson<String>(etc1),
      'etc2': serializer.toJson<String>(etc2),
      'etc3': serializer.toJson<String>(etc3),
      'etc4': serializer.toJson<String>(etc4),
      'etc5': serializer.toJson<String>(etc5),
    };
  }

  Book copyWith(
          {int? id,
          Value<int?> category = const Value.absent(),
          String? title,
          String? link,
          String? image,
          String? author,
          String? discount,
          String? publisher,
          String? pubdate,
          String? description,
          DateTime? wdate,
          DateTime? udate,
          String? etc1,
          String? etc2,
          String? etc3,
          String? etc4,
          String? etc5}) =>
      Book(
        id: id ?? this.id,
        category: category.present ? category.value : this.category,
        title: title ?? this.title,
        link: link ?? this.link,
        image: image ?? this.image,
        author: author ?? this.author,
        discount: discount ?? this.discount,
        publisher: publisher ?? this.publisher,
        pubdate: pubdate ?? this.pubdate,
        description: description ?? this.description,
        wdate: wdate ?? this.wdate,
        udate: udate ?? this.udate,
        etc1: etc1 ?? this.etc1,
        etc2: etc2 ?? this.etc2,
        etc3: etc3 ?? this.etc3,
        etc4: etc4 ?? this.etc4,
        etc5: etc5 ?? this.etc5,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('image: $image, ')
          ..write('author: $author, ')
          ..write('discount: $discount, ')
          ..write('publisher: $publisher, ')
          ..write('pubdate: $pubdate, ')
          ..write('description: $description, ')
          ..write('wdate: $wdate, ')
          ..write('udate: $udate, ')
          ..write('etc1: $etc1, ')
          ..write('etc2: $etc2, ')
          ..write('etc3: $etc3, ')
          ..write('etc4: $etc4, ')
          ..write('etc5: $etc5')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      category,
      title,
      link,
      image,
      author,
      discount,
      publisher,
      pubdate,
      description,
      wdate,
      udate,
      etc1,
      etc2,
      etc3,
      etc4,
      etc5);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.category == this.category &&
          other.title == this.title &&
          other.link == this.link &&
          other.image == this.image &&
          other.author == this.author &&
          other.discount == this.discount &&
          other.publisher == this.publisher &&
          other.pubdate == this.pubdate &&
          other.description == this.description &&
          other.wdate == this.wdate &&
          other.udate == this.udate &&
          other.etc1 == this.etc1 &&
          other.etc2 == this.etc2 &&
          other.etc3 == this.etc3 &&
          other.etc4 == this.etc4 &&
          other.etc5 == this.etc5);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<int?> category;
  final Value<String> title;
  final Value<String> link;
  final Value<String> image;
  final Value<String> author;
  final Value<String> discount;
  final Value<String> publisher;
  final Value<String> pubdate;
  final Value<String> description;
  final Value<DateTime> wdate;
  final Value<DateTime> udate;
  final Value<String> etc1;
  final Value<String> etc2;
  final Value<String> etc3;
  final Value<String> etc4;
  final Value<String> etc5;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.image = const Value.absent(),
    this.author = const Value.absent(),
    this.discount = const Value.absent(),
    this.publisher = const Value.absent(),
    this.pubdate = const Value.absent(),
    this.description = const Value.absent(),
    this.wdate = const Value.absent(),
    this.udate = const Value.absent(),
    this.etc1 = const Value.absent(),
    this.etc2 = const Value.absent(),
    this.etc3 = const Value.absent(),
    this.etc4 = const Value.absent(),
    this.etc5 = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    required String title,
    required String link,
    required String image,
    required String author,
    required String discount,
    required String publisher,
    required String pubdate,
    required String description,
    required DateTime wdate,
    required DateTime udate,
    required String etc1,
    required String etc2,
    required String etc3,
    required String etc4,
    required String etc5,
  })  : title = Value(title),
        link = Value(link),
        image = Value(image),
        author = Value(author),
        discount = Value(discount),
        publisher = Value(publisher),
        pubdate = Value(pubdate),
        description = Value(description),
        wdate = Value(wdate),
        udate = Value(udate),
        etc1 = Value(etc1),
        etc2 = Value(etc2),
        etc3 = Value(etc3),
        etc4 = Value(etc4),
        etc5 = Value(etc5);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<int>? category,
    Expression<String>? title,
    Expression<String>? link,
    Expression<String>? image,
    Expression<String>? author,
    Expression<String>? discount,
    Expression<String>? publisher,
    Expression<String>? pubdate,
    Expression<String>? description,
    Expression<DateTime>? wdate,
    Expression<DateTime>? udate,
    Expression<String>? etc1,
    Expression<String>? etc2,
    Expression<String>? etc3,
    Expression<String>? etc4,
    Expression<String>? etc5,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (link != null) 'link': link,
      if (image != null) 'image': image,
      if (author != null) 'author': author,
      if (discount != null) 'discount': discount,
      if (publisher != null) 'publisher': publisher,
      if (pubdate != null) 'pubdate': pubdate,
      if (description != null) 'description': description,
      if (wdate != null) 'wdate': wdate,
      if (udate != null) 'udate': udate,
      if (etc1 != null) 'etc1': etc1,
      if (etc2 != null) 'etc2': etc2,
      if (etc3 != null) 'etc3': etc3,
      if (etc4 != null) 'etc4': etc4,
      if (etc5 != null) 'etc5': etc5,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<int?>? category,
      Value<String>? title,
      Value<String>? link,
      Value<String>? image,
      Value<String>? author,
      Value<String>? discount,
      Value<String>? publisher,
      Value<String>? pubdate,
      Value<String>? description,
      Value<DateTime>? wdate,
      Value<DateTime>? udate,
      Value<String>? etc1,
      Value<String>? etc2,
      Value<String>? etc3,
      Value<String>? etc4,
      Value<String>? etc5}) {
    return BooksCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      link: link ?? this.link,
      image: image ?? this.image,
      author: author ?? this.author,
      discount: discount ?? this.discount,
      publisher: publisher ?? this.publisher,
      pubdate: pubdate ?? this.pubdate,
      description: description ?? this.description,
      wdate: wdate ?? this.wdate,
      udate: udate ?? this.udate,
      etc1: etc1 ?? this.etc1,
      etc2: etc2 ?? this.etc2,
      etc3: etc3 ?? this.etc3,
      etc4: etc4 ?? this.etc4,
      etc5: etc5 ?? this.etc5,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (discount.present) {
      map['discount'] = Variable<String>(discount.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (pubdate.present) {
      map['pubdate'] = Variable<String>(pubdate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (wdate.present) {
      map['wdate'] = Variable<DateTime>(wdate.value);
    }
    if (udate.present) {
      map['udate'] = Variable<DateTime>(udate.value);
    }
    if (etc1.present) {
      map['etc1'] = Variable<String>(etc1.value);
    }
    if (etc2.present) {
      map['etc2'] = Variable<String>(etc2.value);
    }
    if (etc3.present) {
      map['etc3'] = Variable<String>(etc3.value);
    }
    if (etc4.present) {
      map['etc4'] = Variable<String>(etc4.value);
    }
    if (etc5.present) {
      map['etc5'] = Variable<String>(etc5.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('image: $image, ')
          ..write('author: $author, ')
          ..write('discount: $discount, ')
          ..write('publisher: $publisher, ')
          ..write('pubdate: $pubdate, ')
          ..write('description: $description, ')
          ..write('wdate: $wdate, ')
          ..write('udate: $udate, ')
          ..write('etc1: $etc1, ')
          ..write('etc2: $etc2, ')
          ..write('etc3: $etc3, ')
          ..write('etc4: $etc4, ')
          ..write('etc5: $etc5')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<String> discount = GeneratedColumn<String>(
      'discount', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publisherMeta =
      const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
      'publisher', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubdateMeta =
      const VerificationMeta('pubdate');
  @override
  late final GeneratedColumn<String> pubdate = GeneratedColumn<String>(
      'pubdate', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wdateMeta = const VerificationMeta('wdate');
  @override
  late final GeneratedColumn<DateTime> wdate = GeneratedColumn<DateTime>(
      'wdate', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _udateMeta = const VerificationMeta('udate');
  @override
  late final GeneratedColumn<DateTime> udate = GeneratedColumn<DateTime>(
      'udate', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _etc1Meta = const VerificationMeta('etc1');
  @override
  late final GeneratedColumn<String> etc1 = GeneratedColumn<String>(
      'etc1', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _etc2Meta = const VerificationMeta('etc2');
  @override
  late final GeneratedColumn<String> etc2 = GeneratedColumn<String>(
      'etc2', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _etc3Meta = const VerificationMeta('etc3');
  @override
  late final GeneratedColumn<String> etc3 = GeneratedColumn<String>(
      'etc3', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _etc4Meta = const VerificationMeta('etc4');
  @override
  late final GeneratedColumn<String> etc4 = GeneratedColumn<String>(
      'etc4', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _etc5Meta = const VerificationMeta('etc5');
  @override
  late final GeneratedColumn<String> etc5 = GeneratedColumn<String>(
      'etc5', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        category,
        title,
        link,
        image,
        author,
        discount,
        publisher,
        pubdate,
        description,
        wdate,
        udate,
        etc1,
        etc2,
        etc3,
        etc4,
        etc5
      ];
  @override
  String get aliasedName => _alias ?? 'books';
  @override
  String get actualTableName => 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    } else if (isInserting) {
      context.missing(_discountMeta);
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    } else if (isInserting) {
      context.missing(_publisherMeta);
    }
    if (data.containsKey('pubdate')) {
      context.handle(_pubdateMeta,
          pubdate.isAcceptableOrUnknown(data['pubdate']!, _pubdateMeta));
    } else if (isInserting) {
      context.missing(_pubdateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('wdate')) {
      context.handle(
          _wdateMeta, wdate.isAcceptableOrUnknown(data['wdate']!, _wdateMeta));
    } else if (isInserting) {
      context.missing(_wdateMeta);
    }
    if (data.containsKey('udate')) {
      context.handle(
          _udateMeta, udate.isAcceptableOrUnknown(data['udate']!, _udateMeta));
    } else if (isInserting) {
      context.missing(_udateMeta);
    }
    if (data.containsKey('etc1')) {
      context.handle(
          _etc1Meta, etc1.isAcceptableOrUnknown(data['etc1']!, _etc1Meta));
    } else if (isInserting) {
      context.missing(_etc1Meta);
    }
    if (data.containsKey('etc2')) {
      context.handle(
          _etc2Meta, etc2.isAcceptableOrUnknown(data['etc2']!, _etc2Meta));
    } else if (isInserting) {
      context.missing(_etc2Meta);
    }
    if (data.containsKey('etc3')) {
      context.handle(
          _etc3Meta, etc3.isAcceptableOrUnknown(data['etc3']!, _etc3Meta));
    } else if (isInserting) {
      context.missing(_etc3Meta);
    }
    if (data.containsKey('etc4')) {
      context.handle(
          _etc4Meta, etc4.isAcceptableOrUnknown(data['etc4']!, _etc4Meta));
    } else if (isInserting) {
      context.missing(_etc4Meta);
    }
    if (data.containsKey('etc5')) {
      context.handle(
          _etc5Meta, etc5.isAcceptableOrUnknown(data['etc5']!, _etc5Meta));
    } else if (isInserting) {
      context.missing(_etc5Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount'])!,
      publisher: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publisher'])!,
      pubdate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubdate'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      wdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}wdate'])!,
      udate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}udate'])!,
      etc1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etc1'])!,
      etc2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etc2'])!,
      etc3: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etc3'])!,
      etc4: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etc4'])!,
      etc5: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etc5'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String description;
  const Category({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  Category copyWith({int? id, String? description}) => Category(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.description == this.description);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> description;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String>? description}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $BooksTable books = $BooksTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books, categories];
}
