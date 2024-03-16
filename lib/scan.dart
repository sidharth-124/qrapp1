import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'cam.dart';


class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(height: 700,width: 500,color: Colors.black,
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(
                    'https://tse2.mm.bing.net/th?id=OIP.CGN_R3YtmCaxNFdrPQCKBQHaHT&pid=Api&P=0&h=180',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(color: Colors.white,
                child: QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cam()),
                  );
                },
                child: Text('scan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
