// ignore_for_file: file_names, avoid_print, non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:final_project/constants/url.dart';
import 'package:final_project/provider/Shared_preferences/shared_preferencesProvider.dart';
import 'package:final_project/screens/TaskPages/home_page.dart';
import 'package:final_project/screens/authentication/login.dart';
import 'package:final_project/utils/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class AuthenticationProvider extends ChangeNotifier {
  final requestBaseUrl = AppUrl.baseUrl;

// Setter
  bool _isLoading = false;
  String _resMessage = '';

//Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/users/";

    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));
      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = "Account Created";
        notifyListeners();
        PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
        final res = json.decode(req.body);
        print(req.body);
        print(res);
      } else {
        final res = json.decode(req.body);
        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try Again";
      notifyListeners();

      print(":::: $e");
    }
  }

  void LoginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/users/login";

    final body = {"email": email, "password": password};
    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));
      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        _isLoading = false;
        _resMessage = "Login SuccessFully!";
        notifyListeners();

        //Save user data and then navigate to home page
        final userId = res['user']['id'];
        final token = res['authToken'];
        SharedDataProvider().saveToken(token);
        SharedDataProvider().saveUserId(userId);

        PageNavigator(ctx: context).nextPageOnly(page: const HomePage());

        print(req.body);
        print(res);
      } else {
        final res = json.decode(req.body);
        _resMessage = res['message'];
        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try Again";
      notifyListeners();

      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
