import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

List<Photos> Photolist = [];
Future<List<Photos>> getPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      Photos photos = Photos(title: i['title'], url: i['url']);
      Photolist.add(photos);
    }
    return Photolist;
  } else {
    return Photolist;
  }
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API Part 8')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  return ListView.builder(
                      itemCount: Photolist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          title: Text(snapshot.data![index].title.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}
