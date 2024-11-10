import 'package:chavelin_app/ui/Flight/passenger_info_screen.dart';
import 'package:flutter/material.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({super.key});

  @override
  _FlightDetailsScreenState createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn giá'),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.share),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flight details (top section)
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.grey[200],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chiều đi  T7, 12 thg 10  19g',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.flight_takeoff, color: Colors.orange),
                      SizedBox(width: 10),
                      Text(
                        '19:00  SGN  TP. Hồ Chí Minh\nCảng hàng không Quốc tế Tân Sơn Nhất T1',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Icon(Icons.more_horiz, color: Colors.grey),
                          ],
                        ),
                      ),
                      Text(
                        'Trung chuyển tại Hà Nội, 15g 50p\nKiểm tra lại hành lý',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.flight_land, color: Colors.orange),
                      SizedBox(width: 10),
                      Text(
                        '14:00  DIN  Điện Biên Phủ\nSân bay Điện Biên Phủ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Xem chi tiết ⟶',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Price and class selection
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Phổ Thông/Phổ Thông Cao Cấp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Từ AED 3.995',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bag',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'Còn 2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PassengerInfoScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const Text('Chọn'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.work_outline, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Hành lý xách tay: 1 × 10 kg',
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.luggage, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Hành lý ký gửi: 1 × 23 kg',
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Phí huỷ vé: từ AED 221,00',
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.cached, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Đổi vé miễn phí', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Xuất vé: Trong vòng 45 phút sau khi thanh toán',
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Khoảng 986 đặm/điểm',
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Updated information
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.grey[200],
              child: const Row(
                children: [
                  Text(
                    'Cập nhật gần nhất: 18:33:07',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(Icons.update, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
