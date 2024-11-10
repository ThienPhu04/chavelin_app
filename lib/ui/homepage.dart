// lib/homepage.dart

import 'package:chavelin_app/page/message_page.dart';
import 'package:chavelin_app/page/trip_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart'; // Import thư viện animations

import '../page/homepage_content.dart';
import '../page/user_profile.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Tạo TextEditingController để thu thập đầu vào của người dùng
  TextEditingController _locationController = TextEditingController();
  int _selectedIndex = 0;

  // Danh sách các trang để chuyển đổi khi nhấn vào một mục trong thanh điều hướng dưới cùng
  final List<Widget> _pages = [
    HomepageContent(),
    MessagePage(),
    TripScreen(),
    UserProfile(),
  ];

  // Phương thức xử lý khi nhấn vào các mục trong thanh điều hướng dưới cùng
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật chỉ mục đã chọn để chuyển đổi trang
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sử dụng PageTransitionSwitcher để thêm hiệu ứng chuyển trang
      body: SafeArea(
        child: PageTransitionSwitcher(
          duration: Duration(milliseconds: 500), // Thời gian của hiệu ứng
          transitionBuilder: (Widget child, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return FadeTransition(
              // Bạn có thể thay FadeTransition bằng các hiệu ứng khác như SlideTransition
              opacity: animation,
              child: child,
            );
          },
          child:
              _pages[_selectedIndex], // Trang hiện tại dựa trên chỉ mục đã chọn
        ),
      ),

      // Thêm thanh điều hướng dưới cùng
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Xử lý khi nhấn vào tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outlined,
              size: 30,
            ),
            label: 'Tin nhắn',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
            ),
            label: 'Chuyến đi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Tài khoản',
          ),
        ],
        type: BottomNavigationBarType
            .fixed, // Hiển thị tất cả các mục một cách đều nhau
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}
