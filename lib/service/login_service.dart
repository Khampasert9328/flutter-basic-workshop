import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gennexs_workshop_flutter_basic/models/users_models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> loginService(String email, String password, context) async {
    showDialog(
        context: context,
        builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      String url = 'https://api-charging.onrender.com/users/login';
      Object body = jsonEncode(
        {
          "email": email,
          "password": password,
        },
      );
      final respones = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "accept": "text/plain",
          "Content-Type": "application/json",
        },
      );
      //print("stateCod====${respones.statusCode}");
      log("========stateCode===log:${respones.statusCode}");
      if (respones.statusCode == 200) {
        Navigator.pop(context);
        //Navigator
        //print("stateCod====${respones.statusCode}");
      } else if (respones.statusCode == 400) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Invalid email or password"),
          ),
        );
      }
    } catch (error) {
      rethrow;
    }
  }
  Future<GetUsers?> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://api-charging.onrender.com/users'),
    headers: {
      "accept": "text/plain",
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200) {
    return getUsersFromJson(response.body);
  }
}
}


