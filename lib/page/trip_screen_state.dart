import 'package:flutter/material.dart';

class TripScreen extends StatefulWidget {
  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150,
                child: Column(
                  children: [
                    Text(
                        "Đã lâu bạn chưa đi đâu. Hãy lên kê hoạch cho hành trình mới nào nào",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryButton(icon: Icons.flight, label: "Vé Máy bay"),
                        CategoryButton(
                            icon: Icons.home_work, label: "Khách sạn"),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 24),
            Text("Lựa Chọn Cho Hành Trình Tiếp Theo",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            DestinationSection(title: "Đà Lạt"),
            DestinationSection(title: "Đà Nẵng"),
          ]),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(label),
      ],
    );
  }
}

class DestinationSection extends StatelessWidget {
  final String title;

  DestinationSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              HotelCard(name: "Hotel 1", rating: "4.3", price: "AED 323"),
              HotelCard(name: "Hotel 2", rating: "4.5", price: "AED 560"),
              HotelCard(name: "Hotel 3", rating: "4.0", price: "AED 450"),
            ],
          ),
        ),
      ],
    );
  }
}

class HotelCard extends StatelessWidget {
  final String name;
  final String rating;
  final String price;

  HotelCard({required this.name, required this.rating, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 8),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.network('https://via.placeholder.com/150',
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Rating: $rating"),
                  Text(price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Preferred height of the AppBar

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(140.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          height: preferredSize.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://via.placeholder.com/800x400'), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: preferredSize.height,
          color: Colors.deepPurple.withOpacity(0.4),
        ),
        // AppBar content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Chuyến Đi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Row of buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildIconButton("Tất cả đơn đặt", Icons.search),
                      SizedBox(width: 8),
                      _buildIconButton("Danh Sách Chuẩn Bị", Icons.list),
                      SizedBox(width: 8),
                      _buildIconButton(
                          "Bộ quy đổi tiền tệ", Icons.currency_exchange),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Method to create each icon button
  Widget _buildIconButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 18),
      label: Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.5), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
    );
  }
}
