import 'package:chavelin_app/ui/Hotel/detail_Hotel.dart';
import 'package:flutter/material.dart';

// Model cho dữ liệu khách sạn
class Hotel {
  final String name;
  final double rating;
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final int discountPercent;

  Hotel({
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercent,
  });
}

class HotelList extends StatefulWidget {
  // Dữ liệu khách sạn từ API hoặc bất kỳ nguồn nào khác
  final List<Hotel> hotels;

  const HotelList({Key? key, required this.hotels}) : super(key: key);

  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết quả tìm kiếm khách sạn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần tiêu đề với số lượng khách sạn
            Text(
              'Đã tìm thấy ${widget.hotels.length} chỗ nghỉ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Khoảng cách giữa tiêu đề và danh sách

            // Danh sách khách sạn được hiển thị
            Expanded(
              child: ListView.builder(
                itemCount: widget.hotels.length,
                itemBuilder: (context, index) {
                  final hotel = widget.hotels[index];
                  return _buildHotelCard(hotel);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget thẻ khách sạn
  Widget _buildHotelCard(Hotel hotel) {
    return InkWell(
      onTap: () {
        print('Hotel ${hotel.name} clicked!');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailHotel()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh khách sạn
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                hotel.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10), // Khoảng cách giữa ảnh và thông tin khách sạn

            // Thông tin khách sạn
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${hotel.rating}/5',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 10), // Khoảng cách giữa tên khách sạn và giá

                  // Giá và giảm giá
                  Row(
                    children: [
                      // Giá gốc (gạch ngang)
                      Text(
                        '${hotel.originalPrice.toStringAsFixed(0)}đ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                          width: 5), // Khoảng cách giữa giá gốc và giảm giá

                      // Phần giảm giá
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Giảm ${hotel.discountPercent}%',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  // Giá đã giảm
                  Text(
                    '${hotel.discountedPrice.toStringAsFixed(0)}đ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// // Giả sử bạn có một hàm lấy dữ liệu từ API
// Future<List<Hotel>> fetchHotels() async {
//   final response = await http.get(Uri.parse('https://api.example.com/hotels'));
//
//   if (response.statusCode == 200) {
//     List<dynamic> data = jsonDecode(response.body);
//     return data.map((json) => Hotel.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load hotels');
//   }
// }
