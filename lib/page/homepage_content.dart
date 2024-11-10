import 'package:flutter/material.dart';
import '../ui/combo_page.dart';
import '../ui/Flight/flight_page.dart';
import '../ui/flight_status_page.dart';
import '../ui/Hotel/hotel_page.dart';
import '../ui/partner_page.dart';
import '../ui/ticket_page.dart';
import '../ui/tour_page.dart';
import '../ui/train_page.dart';

class HomepageContent extends StatelessWidget {
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng của màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          searchLocation(context, _locationController),
          Container(
            width: screenWidth,
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration:
                const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCategoryColumn(context, Icons.home_work_rounded,
                        "Khách sạn", HotelPage()),
                    buildCategoryColumn(
                        context, Icons.flight, "Chuyến bay", FlightPage()),
                    buildCategoryColumn(
                        context, Icons.hotel, "Combo tiết kiệm", ComboPage()),
                    buildCategoryColumn(
                        context, Icons.train, "Vé tàu", TrainPage()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCategoryColumn(context, Icons.attractions_sharp,
                        "Tour& Hoạt động", TourPage()),
                    buildCategoryColumn(context, Icons.screen_search_desktop,
                        "Trạng thái chuyến bay", FlightStatusPage()),
                    buildCategoryColumn(
                        context, Icons.handshake, "Đối tác", PartnerPage()),
                    buildCategoryColumn(
                        context, Icons.title, "Vé Trip.com", TicketPage()),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          PopularDestinations(),
        ],
      ),
    );
  }

  // Phương thức trợ giúp để tạo một cột danh mục với văn bản và biểu tượng, có hiệu ứng chuyển trang
  Widget buildCategoryColumn(
      BuildContext context, IconData icon, String label, Widget targetPage) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            // Sử dụng PageRouteBuilder để thêm hiệu ứng SlideTransition
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    targetPage,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0); // Bắt đầu từ bên phải
                  const end = Offset.zero; // Kết thúc ở vị trí ban đầu
                  const curve = Curves.linear; // Hiệu ứng easing

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration:
                    Duration(milliseconds: 500), // Thời gian chuyển tiếp
              ),
            );
          },
          icon: Icon(icon),
          color: Colors.lightBlue,
          iconSize: 28,
          tooltip: label,
        ),
        Container(
          width: 80,
          child: Text(
            label,
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Widget cho ô nhập tìm kiếm vị trí
  Widget searchLocation(
      BuildContext context, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Nhập nơi bạn muốn tìm!",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.text_fields, color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New Widget to display popular destinations
class PopularDestinations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Địa điểm bạn có thể thích",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: NeverScrollableScrollPhysics(),
            children: [
              buildDestinationCard(
                "Phú Quốc",
                "4.6/5 - 254 Đánh giá",
                "5,206,534 đ",
                "assets/images/phu_quoc.jpg",
              ),
              buildDestinationCard(
                "Hồ Xuân Hương",
                "4.6/5 - 254 Đánh giá",
                "3,000,000 đ",
                "assets/images/ho_xuan_huong.jpg",
              ),
              buildDestinationCard(
                "Khách sạn Oscar Sài Gòn",
                "4.3/5 - 134 Đánh giá",
                "902,554 đ",
                "assets/images/oscar_sai_gon.jpg",
              ),
              buildDestinationCard(
                "Căn hộ Vinhomes Central Park",
                "4.6/5 - 254 Đánh giá",
                "1,269,263 đ",
                "assets/images/vinhomes.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDestinationCard(
      String title, String rating, String price, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.black54, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              rating,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              price,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
