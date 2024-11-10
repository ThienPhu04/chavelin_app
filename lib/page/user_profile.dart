import 'package:chavelin_app/ui/User/profile_detail.dart';
import 'package:chavelin_app/ui/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                color: Colors.white, // Set the color in BoxDecoration
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10), bottom: Radius.circular(10)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _itemUserOrder(
                        context, Icons.list_alt, "Tất cả đơn đặt", Homepage()),
                    _itemUserOrder(
                        context, Icons.list_alt, "Tất cả đơn đặt", Homepage()),
                    _itemUserOrder(
                        context, Icons.list_alt, "Tất cả đơn đặt", Homepage()),
                  ]),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                      50), // Đặt chiều rộng và chiều cao
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onPressed: () => _logout(context),
                child: Text("Đăng xuất"))

            // Các widget khác của bạn ở đây
          ],
        ),
      ),
    );
  }

  Widget _itemUserOrder(
      BuildContext context, IconData icon, String label, Widget targetPage) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            // Điều hướng đến trang đích khi nhấn vào nút
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          icon: Icon(icon),
          color: Colors.lightBlue,
          iconSize: 28,
          tooltip: label, // Thêm chú thích để hỗ trợ truy cập
        ),
        Container(
          width: 80, // Đặt chiều rộng cố định để văn bản có thể xuống dòng
          child: Text(
            label,
            textAlign: TextAlign.center, // Căn giữa văn bản
            softWrap: true, // Cho phép văn bản xuống nhiều dòng
            maxLines: 2, // Giới hạn tối đa 2 dòng
            overflow:
                TextOverflow.ellipsis, // Thêm dấu ba chấm nếu văn bản quá dài
            style: TextStyle(fontSize: 12), // Điều chỉnh kích thước chữ nếu cần
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    // Xử lý logic đăng xuất tại đây (Ví dụ: Xóa token, điều hướng về màn hình login)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Đăng xuất"),
          content: Text("Bạn có chắc chắn muốn đăng xuất không?"),
          actions: <Widget>[
            TextButton(
              child: Text("Hủy"),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
            ),
            TextButton(
              child: Text("Đăng xuất"),
              onPressed: () {
                // Thực hiện đăng xuất ở đây
                Navigator.of(context).pushReplacementNamed(
                    '/login'); // Điều hướng về màn hình login
              },
            ),
          ],
        );
      },
    );
  }
}

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String userName = "Thành viên Trip.com";
  String accountManageText = "Quản lý Tài khoản của tôi >";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFB3C7E6), // Background color
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 30, color: Colors.blue),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Xin chào $userName',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: accountManageText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _navigateToProfileDetail(context);
                    },
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.settings, color: Colors.black),
        ],
      ),
    );
  }

  void _navigateToProfileDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileDetail(
            userProfile:
                createUserProfile()), // Ensure you provide the UserProfile
      ),
    );
  }
}
