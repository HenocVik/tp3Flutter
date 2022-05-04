import 'dart:convert';

import 'package:tp_groupe5/models/userModel.dart';
import 'package:tp_groupe5/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserRepository implements Repository {
  String dataUrl = 'https://ifri.raycash.net';
  @override
  Future<String> delectedUser(UserModel user) async {
    var url = Uri.parse('$dataUrl/getusers/${user.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> users = [];
    var url = Uri.parse('$dataUrl/getusers');
    var response = await http.get(url);
    print('status code:${response.statusCode}');
    Map<String, dynamic> body = json.decode(response.body.toString());
    List<dynamic> data = body["message"];
    if (response.statusCode == 200) {
      for (Map i in data) {
        users.add(UserModel.fromJson(i));
      }
      return users;
    } else {
      return users;
    }
  }

  @override
  Future<String> patchCompleted(UserModel userModel) async {
    var url = Uri.parse('$dataUrl/getusers/${userModel.id}');
    String resData = '';
    await http.patch(url,
        body: {'citation': (userModel.citation!)},
        headers: {'Authorization': 'your_token'}).then((response) {
      Map<String, dynamic> result = json.decode(response.body);

      return resData = result['citation'];
    });
    return resData;
  }

  @override
  Future<String> putCompleted(UserModel user) async {
    var url = Uri.parse('$dataUrl/updateuser/${user.id}');
    String resData = 'true';
    await http.put(
      url,
      body: user.toJson(),
    );
    return 'true';
  }

  @override
  Future<String> postUser(UserModel user) async {
    print('${user.toJson()}');
    var url = Uri.parse('$dataUrl/adduser');
    var result = '';
    var response = await http.post(url, body: user.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
