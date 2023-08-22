import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfiniteScroll extends StatefulWidget {
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  final controller = ScrollController();
  // List<String> items = List.generate(15, (index) => 'Item ${index + 1}');
  List<String> items = [];
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    debugPrint("initState :");

    fetch();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;

    const limit = 25;
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        page++;
        isLoading = false;

        if (newItems.length < limit) {
          hasMore = false;
        }

        items.addAll(newItems.map<String>((item) {
          final number = item['id'];
          return 'Item $number';
        }).toList());
      });
    }

    // setState(() {
    //   items.addAll(['Item A', 'Item B', 'Item C', 'Item D']);
    // });
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 1;
      items.clear();
    });

    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll ListView'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            controller: controller,
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];

                return ListTile(
                  title: Text(item),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: hasMore
                        ? const CircularProgressIndicator()
                        : const Text('No more data to load'),
                  ),
                );
              }
            }),
      ),
    );
  }
}
