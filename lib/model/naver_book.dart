// To parse this JSON data, do
//
//     final naverBook = naverBookFromJson(jsonString);

import 'dart:convert';

NaverBook naverBookFromJson(String str) => NaverBook.fromJson(json.decode(str));

String naverBookToJson(NaverBook data) => json.encode(data.toJson());

class NaverBook {
  NaverBook({
    this.lastBuildDate,
    this.total,
    this.start,
    this.display,
    required this.items ,
  });

  String? lastBuildDate;
  int? total;
  int? start;
  int? display;
  List<Item> items;

  factory NaverBook.fromJson(Map<String, dynamic> json) => NaverBook(
    lastBuildDate: json["lastBuildDate"] == null ? null : json["lastBuildDate"],
    total: json["total"] == null ? null : json["total"],
    start: json["start"] == null ? null : json["start"],
    display: json["display"] == null ? null : json["display"],
    items: json["items"] == null ? <Item>[] : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lastBuildDate": lastBuildDate == null ? null : lastBuildDate,
    "total": total == null ? null : total,
    "start": start == null ? null : start,
    "display": display == null ? null : display,
    "items": items == null ? <Item>[] : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.title,
    this.link,
    this.image,
    this.author,
    this.discount,
    this.publisher,
    this.pubdate,
    this.isbn,
    this.description,
  });

  String? title;
  String? link;
  String? image;
  String? author;
  String? discount;
  String? publisher;
  String? pubdate;
  String? isbn;
  String? description;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"] == null ? null : json["title"],
    link: json["link"] == null ? null : json["link"],
    image: json["image"] == null ? null : json["image"],
    author: json["author"] == null ? null : json["author"],
    discount: json["discount"] == null ? null : json["discount"],
    publisher: json["publisher"] == null ? null : json["publisher"],
    pubdate: json["pubdate"] == null ? null : json["pubdate"],
    isbn: json["isbn"] == null ? null : json["isbn"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "link": link == null ? null : link,
    "image": image == null ? null : image,
    "author": author == null ? null : author,
    "discount": discount == null ? null : discount,
    "publisher": publisher == null ? null : publisher,
    "pubdate": pubdate == null ? null : pubdate,
    "isbn": isbn == null ? null : isbn,
    "description": description == null ? null : description,
  };
}
