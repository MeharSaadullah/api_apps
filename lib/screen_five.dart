import 'dart:convert';

import 'package:api_apps/Models_5.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({super.key});

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  Future<ProductModel> getProductApi() async {
    final Response = await http.get(
        Uri.parse('https://webhook.site/18b5a3c5-0ba9-4348-ba3a-39c28ecd9dbb'));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Part 11'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductModel>(
            future: getProductApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .3,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        .25,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data!
                                                .data![index]
                                                .images![position]
                                                .url
                                                .toString()))),
                                  );
                                }),
                          )
                        ],
                      );
                    });
              } else {
                return Text('LOADING');
              }
              ;
            },
          ))
        ],
      ),
    );
  }
}
