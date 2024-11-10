import 'package:chavelin_app/ui/User/edit_profile.dart';
import 'package:flutter/material.dart';

// UserProfile model to represent user data
class UserProfile {
  final String displayName;
  final String gender;
  final String country;
  final String city;
  final List<String> popularCities;
  final String email; // Email linked
  final String phone; // Phone linked
  final String legalName; // Full legal name
  final String birthDate; // Date of birth

  UserProfile({
    required this.displayName,
    required this.gender,
    required this.country,
    required this.city,
    required this.popularCities,
    required this.email,
    required this.phone,
    required this.legalName,
    required this.birthDate,
  });
}

class ProfileDetail extends StatefulWidget {
  final UserProfile userProfile; // Accept UserProfile

  const ProfileDetail({super.key, required this.userProfile});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Tài Khoản'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Avatar và thông tin tài khoản
            Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Bảo Mật Tài Khoản
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bảo Mật Tài Khoản',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email Đã Liên Kết'),
                      subtitle: Text(widget
                          .userProfile.email), // Use email from userProfile
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Điện Thoại Đã Liên Kết'),
                      subtitle: Text(widget
                          .userProfile.phone), // Use phone from userProfile
                    ),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Đặt Lại Mật Khẩu'),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Đặt'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Cập nhật Hồ Sơ Thành viên
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cập nhật Hồ sơ Thành viên',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.userProfile
                                    .displayName, // Use full legal name from userProfile
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              Text(widget.userProfile.birthDate,
                                  style: TextStyle(
                                      fontWeight: FontWeight
                                          .w300)), // Use birth date from userProfile
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Navigate to ProfileDetail and pass the user profile
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    userProfile: createUserProfile(),
                                  ), // Ensure you have the user profile
                                ),
                              );
                            },
                            child: Text(
                              'Chỉnh sửa', // Button text
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Thông tin cá nhân
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin cá nhân',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Tên hiển thị'),
                      subtitle: Text(widget.userProfile
                          .displayName), // Use display name from userProfile
                    ),
                    ListTile(
                      leading: Icon(Icons.transgender),
                      title: Text('Giới tính'),
                      subtitle: Text(widget
                          .userProfile.gender), // Use gender from userProfile
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Quốc gia hoặc khu vực'),
                      subtitle: Text(widget
                          .userProfile.country), // Use country from userProfile
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text('Thành phố cư trú'),
                      subtitle: Text(
                          widget.userProfile.city), // Use city from userProfile
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('Các thành phố du lịch phổ biến'),
                      subtitle: Text(widget.userProfile.popularCities.join(
                          ', ')), // Join popular cities into a single string
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

UserProfile createUserProfile() {
  return UserProfile(
    displayName: 'Doan Thien Phu',
    gender: 'Nam',
    country: 'Việt Nam',
    city: 'Hà Nội',
    popularCities: ['Đà Nẵng', 'Nha Trang', 'Phú Quốc'],
    email: 'thien*****@gmail.com',
    phone: '84-3***3024',
    legalName: '', // Example full legal name
    birthDate: '31/12/2004', // Example birth date
  );
}
