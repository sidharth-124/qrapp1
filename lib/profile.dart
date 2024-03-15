import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 90,
            backgroundImage: NetworkImage(
              'https://tse2.mm.bing.net/th?id=OIP.CGN_R3YtmCaxNFdrPQCKBQHaHT&pid=Api&P=0&h=180',
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text("hfjkol"),
          SizedBox(
            height: 24,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your contact number',
            ),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your email',
          )),
        ],
      ),
    );
  }
}
