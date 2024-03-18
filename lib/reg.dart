import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qrapp/login.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  final _name = TextEditingController();
  final _emailid = TextEditingController();
  final _rollno = TextEditingController();
  final _password = TextEditingController();

  void register() async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/register');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': _name.text,
          'email': _emailid.text,
          'rollno': _rollno.text,
          'password': _password.text,
        }));
    var data=jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('success');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
            child: Container(
          color: Colors.black,
          height: 700,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Registration',
                  style: TextStyle(
                      fontSize: 44,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name.',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _emailid,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email id.',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _rollno,
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
                    labelText: 'Enter your Password.',
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
                  register();
                },
                child: Text('Register'),
              ),
            ],
          ),
        )));
  }
}
