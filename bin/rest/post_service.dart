import 'dart:convert';

import 'package:http/http.dart' as http;

import 'post_model.dart';

class PostService {
  final String url;

  PostService(this.url);

  Future<PostModel> getPostById(int id) async {
    String? errMsg;
    try {
      final http.Response respose = await http.get(
        Uri.parse('$url/$id'),
      ); //https://jsonplaceholder.typicode.com/posts/5

      if (respose.statusCode == 200) {
        return PostModel.fromJson(jsonDecode(respose.body));
      } else {
        errMsg = 'Could not load Post with ID:= $id';
      }
    } catch (err) {
      errMsg = 'Could not load Post with ID:= $id because -> $err';
    }

    throw Exception(errMsg);
  }
}
