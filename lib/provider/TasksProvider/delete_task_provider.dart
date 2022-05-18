// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:final_project/constants/url.dart';
import 'package:final_project/screens/TaskPages/home_page.dart';
import 'package:final_project/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Shared_preferences/shared_preferencesProvider.dart';

class DeleteTaskProvider extends ChangeNotifier {
  final url = AppUrl.baseUrl;

  bool _status = false;

  String _response = '';

  bool get getStatus => _status;

  String get getResponse => _response;


  void deleteTask({String? taskId, BuildContext? ctx}) async {
    final token = await SharedDataProvider().getToken();
    _status = true;
    notifyListeners();

    final _url = "$url/tasks/$taskId";

    final result = await http
        .delete(Uri.parse(_url), headers: {'Authorization': "Bearer $token"});

    print(result.statusCode);

    if (result.statusCode == 200 || result.statusCode == 201) {
      final res = result.body;
      print(res);
      _status = false;

      _response = json.decode(res)['message'];

      notifyListeners();
      PageNavigator(ctx: ctx).nextPageOnly(page: const HomePage());
    } else {
      final res = result.body;
      print(res);
      _status = false;

      _response = json.decode(res)['message'];

      notifyListeners();
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}