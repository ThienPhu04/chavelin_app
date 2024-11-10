import 'package:chavelin_app/ui/Hotel/solve_room.dart';
import 'package:flutter/material.dart';


class DetailHotel extends StatefulWidget {
  const DetailHotel({super.key});

  @override
  State<DetailHotel> createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khách sạn Nature - Nam Kỳ Khởi Nghĩa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://example.com/hotel_image.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            // Hotel Information
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Khách sạn Nature - Nam Kỳ Khởi Nghĩa',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Text(' 5.0/5'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('8A Nam Kỳ Khởi Nghĩa, Phường 1, Đà Lạt'),
                  SizedBox(height: 10),
                  // Highlights Section
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Mới hoạt động'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Mới cải tạo'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Có dịch vụ đón tại sân bay'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Phòng chờ cao cấp'),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Nhận phòng và trả phòng',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text('10 thg 10 - 11 thg 10'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Phòng và Khách',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.door_front_door),
                          SizedBox(width: 5),
                          Text('1'),
                          SizedBox(width: 10),
                          Icon(Icons.person),
                          SizedBox(width: 5),
                          Text('1'),
                          SizedBox(width: 10),
                          Icon(Icons.child_friendly),
                          SizedBox(width: 5),
                          Text('0'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Room Information Card
            InkWell(
              onTap: () {
                // Navigate to another page when the card is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SolveRoom()), // Replace with actual screen
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Room Image and Info
                      Row(
                        children: [
                          // Image of the room
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://example.com/room_image.jpg', // Replace with actual image URL
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Room details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Superior Đôi/Twin - Hướng Nhìn Ra Sân',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.bed),
                                  SizedBox(width: 5),
                                  Text('1 giường queen hoặc 2 giường đơn'),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.home),
                                  SizedBox(width: 5),
                                  Text('20m2'),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.smoke_free),
                                  SizedBox(width: 5),
                                  Text('Không hút thuốc'),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.wifi),
                                  SizedBox(width: 5),
                                  Text('Wi-Fi miễn phí'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      // Price and Discount
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Giảm 40%',
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                '570.996đ',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '332.068đ',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
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
