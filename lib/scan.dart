import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                '',
              ),
            ),
          ),
          QrImageView(
            data: '1234567890',
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
  }
}
