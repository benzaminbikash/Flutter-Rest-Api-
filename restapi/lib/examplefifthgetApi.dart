import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/productModel.dart';

class examplefifthgetApi extends StatefulWidget {
  const examplefifthgetApi({super.key});
  @override
  State<examplefifthgetApi> createState() => _examplefifthgetApiState();
}

class _examplefifthgetApiState extends State<examplefifthgetApi> {
  Future<PostsModal> getApiData() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/e431ed75-c6ea-4204-9493-b6e79b3c9c43'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return PostsModal.fromJson(data);
    } else {
      throw Exception('No Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
            child: FutureBuilder(
                future: getApiData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * 1,
                                color: Colors.red,
                                child: ListView.builder(
                                    itemCount: snapshot
                                        .data!.data[index].images.length,
                                    itemBuilder: (context, position) {
                                      return Container(
                                          margin: const EdgeInsets.all(10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .data[index]
                                                      .images[position]
                                                      .url
                                                      .toString()))));
                                    }),
                              )
                            ],
                          );
                        });
                  } else {
                    return Text('Loading...');
                  }
                })),
      ),
    );
  }
}
