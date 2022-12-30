import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_of_library/books/books_list.dart';
import 'package:master_of_library/colors.dart';
import 'package:master_of_library/database/database.dart';
import 'package:master_of_library/fonts.dart';
import 'package:master_of_library/routes.dart';
import 'package:master_of_library/util/extensions.dart';
import 'package:master_of_library/widgets/scrollview_more.dart';
import 'package:master_of_library/widgets/textfield_underline.dart';

class BookSearchPageController extends GetxController with ScrollMoreViewDelegate {
  static BookSearchPageController get to => Get.find<BookSearchPageController>();
  String query = "";
  var items = [].obs;
  final database = Get.find<MyDatabase>();
  setQuery(String value) {
    query = value;
  }

  Future<void> load() async {
    print('_load');
    final newItems  = await (database.select(database.books)
      ..orderBy([(t) => OrderingTerm.desc( t.wdate)]))
            .get();
    items.value = newItems;
  }
  @override
  Future<void> loadMore() async {
    await load();
  }

  @override
  Future<void> loadStart() async{
    // await load();
  }
}

class BookSearchPage extends StatefulWidget {
  const BookSearchPage({Key? key}) : super(key: key);

  @override
  State<BookSearchPage> createState() => _BookSearchPageState();
}

class _BookSearchPageState extends State<BookSearchPage> {



  loadStartItem() {

    BookSearchPageController.to.loadStart();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BookListTextController());
    Get.put(BookSearchPageController());
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




            Expanded(
              child:
              Obx(() {
                return
                  ScrollMoreView(
                      delegate: BookSearchPageController.to,
                      items: BookSearchPageController.to.items.value,
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

                            ],
                          ),
                        );
                      });
              }),
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(Routes.booksList.name);
          if(result != null) {
            BookSearchPageController.to.loadStart();
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),

    );
  }



}
