
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:final_project/constants/url.dart';
import 'package:final_project/model/task_model.dart';
import 'package:final_project/provider/Shared_preferences/shared_preferencesProvider.dart';
import 'package:http/http.dart' as http;

class GetUserTask {

  final url = AppUrl.baseUrl;

  Future<TaskModel> getTask() async {
     final userId = await SharedDataProvider().getUserId();
    final token = await SharedDataProvider().getToken();

    String _url = "$url/users/$userId/tasks?lastId=&pagination=20";

    try {
      final request = await http
          .get(Uri.parse(_url), headers: {'Authorization': 'Bearer $token'});

      print(request.statusCode);

      if (request.statusCode == 200 || request.statusCode == 201){
        print(request.body);

        if (json.decode(request.body)['tasks'] == null) {
          return TaskModel();
        } else {
          final taskModel = taskModelFromJson(request.body);
          return taskModel;
        }
      } else  {
        print(request.body);
        // final notificationModel = notificationModelFromJson(request.body);

        return TaskModel();
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }

  }

}