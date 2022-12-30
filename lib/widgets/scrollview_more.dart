import 'package:flutter/material.dart';

abstract class  ScrollMoreViewDelegate {
  Future<void> loadMore();
  Future<void> loadStart();
}

class ScrollMoreView extends StatefulWidget {
    const ScrollMoreView({
      Key? key,
      required this.delegate,
      required this.items,
      required this.builder
  }) : super(key: key);
    final ScrollMoreViewDelegate delegate;
    final List items;
    final Widget Function(BuildContext context, dynamic  item) builder;
  @override
  State<ScrollMoreView> createState() => _ScrollMoreViewState();
}

class _ScrollMoreViewState extends State<ScrollMoreView> {
  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 5.0)
    ..addListener(_scrollListener);
    widget.delegate.loadStart();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  _scrollListener() {
      if(_scrollController.offset < 0 ) {
        widget.delegate.loadStart();
      }else if (_scrollController.offset + 100 >= _scrollController.position.maxScrollExtent ) {
        widget.delegate.loadMore();
      }
  }

  @override
  Widget build(BuildContext context) {
          return ListView.builder(
              controller: _scrollController,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return widget.builder(context, item);
              });

  }
}
