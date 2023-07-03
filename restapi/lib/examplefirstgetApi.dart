import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/user_model.dart';

class examplefirstgetApi extends StatefulWidget {
  const examplefirstgetApi({super.key});
  @override
  State<examplefirstgetApi> createState() => _examplefirstgetApiState();
}

class _examplefirstgetApiState extends State<examplefirstgetApi> {
  List<PostsModal> postlist = []; //data hava no name so we used it;
  Future<List<PostsModal>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postlist.clear();
      for (Map<String, dynamic> index in data) {
        postlist.add(PostsModal.fromJson(index));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APi Lesson'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading....');
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white,
                          child: Card(
                            child: Column(
                              children: [
                                Text(postlist[index].id.toString()),
                                Text(postlist[index].title.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: postlist.length,
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
