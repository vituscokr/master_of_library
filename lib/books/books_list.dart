import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_of_library/colors.dart';
import 'package:master_of_library/constants.dart';
import 'package:master_of_library/fonts.dart';
import 'package:master_of_library/model/naver_book.dart';
import 'package:master_of_library/util/extensions.dart';
import 'package:master_of_library/widgets/textfield_underline.dart';
import 'package:dio/dio.dart';

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
  List<Item> _items = <Item>[];

  @override
  Widget build(BuildContext context) {
    Get.put(BookListTextController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: UnderlinedTextField(delegate:BookListTextController.to),
            ),
            ElevatedButton(onPressed: () {
              final text = BookListTextController.to.text.value;
              _search(text);
            }, child: Text('검색')),

            Expanded(
              child: ListView.builder(
                itemCount: _items.length,

                  itemBuilder: (context, index) {
                  final item = _items[index];
                  return

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                            constraints : BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width - 100- 48 -8,
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(item.title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: AppFont.title.bold.colored(AppColor.grayscaleBlack.color)),
                                  Text(item.author ?? "",
                                  style: AppFont.large.bold.colored(AppColor.grayscaleGrayDark.color)),
                                  Text(item.publisher ?? "",
                                    style: AppFont.large.regular.colored(AppColor.grayscaleGrayLight.color)
                                  ),


                              ],
                            ),
                          )
                        ],
                      ),
                    );
              }),
            ),

          ],
        ),
      ),

    );
  }


  _search(String query) async {

    String url = "https://openapi.naver.com/v1/search/book.json";

    Map<String,dynamic> params = {
      "query": query,
      "display": 100,
      "start": 1,
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

    final result = NaverBook.fromJson(response.data);


    setState(() {
      _items = [
        ...result.items,
      ];
    });

  }

}
