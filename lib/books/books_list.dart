import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:master_of_library/colors.dart';
import 'package:master_of_library/constants.dart';
import 'package:master_of_library/database/database.dart';
import 'package:master_of_library/fonts.dart';
import 'package:master_of_library/model/naver_book.dart';
import 'package:master_of_library/util/extensions.dart';
import 'package:master_of_library/widgets/scrollview_more.dart';
import 'package:master_of_library/widgets/textfield_underline.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class ScrollMoreViewController extends GetxController with ScrollMoreViewDelegate{
  static ScrollMoreViewController get to => Get.find<ScrollMoreViewController>();
  final int display = 10;
  int page = 1;
  int start = 1;
  int total = 0;
  bool isAnyMore  = true;
  bool isLoad = false;
  String  query = "";
  var items = [].obs;

  setQuery(String value) {
    query = value;
  }

  Future<List> load() async {
    String url = "https://openapi.naver.com/v1/search/book.xml";
      Map<String,dynamic> params = {
        "query": query,
        "display": display,
        "start": start,
        "sort": "sim"
      };
    final options = Options(
      headers: {
        "X-Naver-Client-Id": AppConstants.naverId,
        "X-Naver-Client-Secret": AppConstants.naverSecret,
      },
    );
    var response = await Dio().get(url ,
        queryParameters: params,
        options: options);

    final document = XmlDocument.parse(response.data);

    var documentTotal = document.findAllElements("total").first;
    total = int.parse(documentTotal.text);


    var documentItems = document.findAllElements("item");

    final newItems = documentItems.map(
            (node) {

          return Item.fromJson({
            'title': node.findElements('title').single.text,
            'link': node.findElements('link').single.text,
            'image': node.findElements('image').single.text,
            'author': node.findElements('author').single.text,
            'discount': node.findElements('discount').single.text,
            'publisher': node.findElements('publisher').single.text,
            'pubdate' : node.findElements('pubdate').single.text,
            'isbn': node.findElements('isbn').single.text,
            'description': node.findElements('description').single.text

          });
        }
    );
    return newItems.toList();
  }
  @override
  Future<void> loadMore() async{
    if(isLoad) {
      return;
    }
    if(!isAnyMore) {
      return;
    }
    if(query.isEmpty) {
      return;
    }
    isLoad = true;
    page = page + 1;
    start = (page -1) * display +1;

    final result = await load();

    final list = [
      ...items,
      ...result
    ];
    items.value = list;

    if(items.length < total) {
      isAnyMore = true;
    }else {
      isAnyMore = false;
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      isLoad = false;
    });
  }
  @override
  Future<void> loadStart() async {
    if(isLoad) {
      return;
    }
    if(query.isEmpty) {
      return;
    }
    total = 0;
    page = 1;
    start = 1;

    isLoad = true;
    final result = await load();

    items.value = [
      ...result
    ];

    if(items.length < total) {
      isAnyMore = true;
    }else {
      isAnyMore = false;
    }
    Future.delayed(const Duration(milliseconds: 1500), () {
      isLoad = false;
    });
  }
}



class BookListTextController extends GetxController with TextFieldDelegate {
  static BookListTextController get to => Get.find<BookListTextController>();
  final  text = "".obs;
  @override
  void onChanged(String txt) {
    text.value = txt;
  }
  @override
  void onSubmited(String txt) {
    text.value = txt;
  }
}

class BooksListPage extends StatefulWidget {
  const BooksListPage({Key? key,
  }) : super(key: key);
  @override
  State<BooksListPage> createState() => _BooksListPageState();
}


class _BooksListPageState extends State<BooksListPage> {
  final database = Get.find<MyDatabase>();

  loadStartItem() {
    final text = BookListTextController.to.text.value;
    ScrollMoreViewController.to.setQuery(text);
    ScrollMoreViewController.to.loadStart();
  }
  @override
  Widget build(BuildContext context) {
    Get.put(BookListTextController());
    Get.put(ScrollMoreViewController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: UnderlinedTextField(
                  delegate:BookListTextController.to,
             onSubmit: loadStartItem,),
            ),
            ElevatedButton(onPressed: () {
                loadStartItem();
            }, child: const Text('검색')),

            ElevatedButton(onPressed: () async{

              String barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "취소", false, ScanMode.DEFAULT);


            }, child: const Text('barcode')),


              Expanded(
                child:
                     Obx(() {
                       return
                        ScrollMoreView(
                          delegate: ScrollMoreViewController.to,
                          items: ScrollMoreViewController.to.items.value,
                          builder: (context, item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Image.network(item.image ?? "",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 8,),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery
                                          .of(context)
                                          .size
                                          .width - 100 - 48 - 8,
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item.title ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: AppFont.title.bold.colored(
                                                AppColor.grayscaleBlack.color)),
                                        Text(item.author ?? "",
                                            style: AppFont.large.bold.colored(
                                                AppColor.grayscaleGrayDark.color)),
                                        Text(item.publisher ?? "",
                                            style: AppFont.large.regular.colored(
                                                AppColor.grayscaleGrayLight.color)
                                        ),


                                      ],
                                    ),
                                  ),
                                  ElevatedButton(onPressed: ()
                            {
                              _addBook(item);
                              Get.back(result: 'done');

                                  }, child: Text("추가"))
                                ],
                              ),
                            );
                          });
                    }),
              ),


          ],
        ),
      ),

    );
  }

  _addBook(Item item ) async {



    await database.into(database.books).insert(

        BooksCompanion.insert(
            title: item.title ?? "",
            link: item.link ?? "",
            image: item.image ?? "",
            author: item.author ?? "",
            discount: item.discount ?? "",
            publisher: item.publisher ?? "",
            pubdate: item.pubdate ?? "",
            description: item.description ?? "" ,
            wdate: DateTime.now(),
            udate: DateTime.now(),
            etc1: "", etc2: "", etc3: "", etc4: "", etc5: "")

    );

  }


  //
  // _search(String query) async {
  //
  //   String url = "https://openapi.naver.com/v1/search/book.json";
  //
  //   Map<String,dynamic> params = {
  //     "query": query,
  //     "display": 10,
  //     "start": 1,
  //     "sort": "sim"
  //   };
  //   final options = Options(
  //     headers: {
  //       "X-Naver-Client-Id": AppConstants.naverId,
  //       "X-Naver-Client-Secret": AppConstants.naverSecret,
  //     },
  //   );
  //
  //   var response = await Dio().get(url ,
  //       queryParameters: params,
  //       options: options);
  //
  //   final result = NaverBook.fromJson(response.data);
  //
  //
  //   setState(() {
  //     _items = [
  //       ...result.items,
  //     ];
  //   });
  //
  // }

}
