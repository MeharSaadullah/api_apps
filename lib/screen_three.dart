import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api_apps/models_3.dart';

import 'package:http/http.dart' as http;

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  List<UserModal> userlist = [];

  Future<List<UserModal>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        userlist.add(UserModal.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API PART 9')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModal>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: userlist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Component(
                                      title: 'Name',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  Component(
                                      title: 'UserName',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  Component(
                                      title: 'e-mail',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  Component(
                                      title: 'Address',
                                      value: snapshot.data![index].address!.city
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
