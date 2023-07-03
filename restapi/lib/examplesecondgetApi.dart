import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/user_model.dart';

class examplesecondgetApi extends StatefulWidget {
  const examplesecondgetApi({super.key});
  @override
  State<examplesecondgetApi> createState() => _examplesecondgetApiState();
}

class _examplesecondgetApiState extends State<examplesecondgetApi> {
  List<Photos> photolist = [];
  Future<List<Photos>> getApiData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        final photos = Photos(title: i['title'], url: i['url']);
        photolist.add(photos);
      }
      return photolist;
    } else {
      throw Exception('No data');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: getApiData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                      itemCount: photolist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.red,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(photolist[index].title.toString()),
                              )
                            ],
                          ),
                        );
                      });
                }
              })),
    );
  }
}

class Photos {
  String? title, url;
  Photos({required this.title, required this.url});
}
