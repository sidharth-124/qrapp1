import 'package:flutter/material.dart';
import 'package:qrapp/reg.dart';
import 'package:qrapp/scan.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body:

      Center(
        child: Container(color: Colors.black,height: 700,width: 500,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontSize: 44,fontWeight: FontWeight.bold,color: Colors.teal), ),
              SizedBox(height: 60,),
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Roll no.',
                  ),
                ),
              ),
              SizedBox(height: 24,),
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                ),
              ),
              SizedBox(height: 24,),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Scan()),
                  );
                },
                child: Text('login'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
    )
    );
  }
}
