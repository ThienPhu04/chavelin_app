import 'package:flutter/material.dart';
import 'dart:async';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Timer _timer;
  int _start = 1800; // 30 minutes in seconds

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán Bảo Đảm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AED 1.586,00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('TP. Hồ Chí Minh -> Điện Biên Phủ'),
            Text('T7, 12 th 10, 20:00-14:00'),
            SizedBox(height: 16),
            Text('Hoàn tất thanh toán trong $timerText'),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Số thẻ ngân hàng'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tên chủ thẻ'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'MM/YY'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'CVV/CVC'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý logic thanh toán ở đây
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Màu nền
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bo tròn góc
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 16), // Padding cho nút
                ),
                child: Text(
                  'Thanh Toán Bằng Thẻ Mới',
                  style: TextStyle(
                    color: Colors.white, // Màu chữ
                    fontSize: 18, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Đậm chữ
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
