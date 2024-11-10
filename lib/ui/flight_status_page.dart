import 'package:flutter/material.dart';

class FlightStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trạng thái chuyến bay"),
      ),
      body: Center(child: Text("This is the Flight Status Page")),
    );
  }
}
