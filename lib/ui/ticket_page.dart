import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vé Trip.com"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                  'assets/image/img_1.png'), // Sử dụng Image.asset với đường dẫn đúng
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 16), // Corrected SizedBox here
            Text(
              "Về Chúng Tôi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0), // Padding 10 cho phần text
              child: const Text(
                "Chúng tôi là nhà cung cấp dịch vụ du lịch toàn diện, cùng với 35 đơn vị tiền tệ địa phương",
                style: TextStyle(
                    fontSize: 16.0), // Thay đổi kích thước chữ nếu cần
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0), // Padding 10 cho phần text
              child: const Text(
                "Có mạng lưới khách sạn và chuyến bay rộng, với hơn 100.000 khách hàng và 500 chuyến bay từ các hãng hàng không.",
                style: TextStyle(
                    fontSize: 16.0), // Thay đổi kích thước chữ nếu cần
              ),
            ),
          ],
        ),
      ),
    );
  }
}
