import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrapp/reg.dart';
import 'package:qrapp/scan.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _rollno = TextEditingController();
  final _password = TextEditingController();
  void login() async {
    Uri url = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response = await http.post(url,headers:<String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body: jsonEncode({
          'rollno': _rollno.text,
          'password': _password.text,
        }));
    var decodeData=jsonDecode(response.body);
    print(decodeData);
    if (response.statusCode == 200) {
      print('success');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Scan()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(decodeData['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Container(
            color: Colors.white,
            height: 700,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller:_rollno ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Roll no.',
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    login();
                  },
                  child: Text('login'),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Reg()),
                    );
                  },
                  child: Text('Don\'t have an account'),
                ),
              ],
            ),
          ),
        ));
  }
}
