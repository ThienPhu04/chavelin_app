import 'package:flutter/material.dart';

class ConfirmPay extends StatefulWidget {
  const ConfirmPay({super.key});

  @override
  State<ConfirmPay> createState() => _ConfirmPayState();
}

class _ConfirmPayState extends State<ConfirmPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán Đảm Bảo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '358.657đ',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Khách sạn Nature – Nam Kỳ Khởi Nghĩa',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Thứ Năm, 10 thg 10 - Thứ Sáu, 11 thg 10',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thẻ Tín Dụng/Ghi Nợ Mới'),
                  Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Thêm logic thanh toán ở đây
              },
              child: Text('Thanh Toán Bằng Thẻ Mới'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chúng Tôi Khớp Giá'),
                SizedBox(width: 8),
                Text('Thanh Toán An Toàn',
                    style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
