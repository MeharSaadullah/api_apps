import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  var data;
  Future<void> GetUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return data = jsonDecode(response.body.toString());
    } else
      () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API PART 10')),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: GetUserApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('LOading');
                    } else {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Component(
                                      title: 'name',
                                      value: data[index]['name'].toString()),
                                  Component(
                                      title: 'username',
                                      value:
                                          data[index]['username'].toString()),
                                  Component(
                                      title: 'address',
                                      value: data[index]['address']['city']
                                          .toString()),
                                  Component(
                                      title: 'address',
                                      value: data[index]['address']['zipcode']
                                          .toString()),
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class Component extends StatelessWidget {
  String title, value;
  Component({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
