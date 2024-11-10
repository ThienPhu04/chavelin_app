import 'package:flutter/material.dart';

import 'profile_detail.dart';

class EditProfile extends StatefulWidget {
  final UserProfile userProfile; // Nhận đối tượng UserProfile

  const EditProfile({super.key, required this.userProfile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String displayName;
  late String gender;
  late String country;
  late String city;
  late String travelCities;

  @override
  void initState() {
    super.initState();
    displayName = widget.userProfile.displayName; // Đặt giá trị từ UserProfile
    gender = widget.userProfile.gender;
    country = widget.userProfile.country;
    city = widget.userProfile.city;
    travelCities =
        widget.userProfile.popularCities.join(', '); // Chuyển đổi thành chuỗi
  }

  void _saveUserInfo() {
    // Logic to save the user information
    UserProfile updatedProfile = UserProfile(
      displayName: displayName,
      gender: gender,
      country: country,
      city: city,
      popularCities: travelCities.split(',').map((e) => e.trim()).toList(),
      email: widget.userProfile.email, // Keep the same email
      phone: widget.userProfile.phone, // Keep the same phone
      legalName: widget.userProfile.legalName, // Keep the same legal name
      birthDate: widget.userProfile.birthDate, // Keep the same birth date
    );

    // Here you can save the updatedProfile to a database, API, or any other storage

    // Show a success message or navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Thông tin đã được lưu thành công!')),
    );

    Navigator.pop(context,
        updatedProfile); // Return to the previous screen with updated profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white70),
            ),
            onPressed: () {
              _saveUserInfo();
              // Call the save function or your handling logic
            },
            child: Text(
              'Lưu',
              style: TextStyle(
                color: Colors
                    .blue, // Ensures text is visible against the black background
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Tên hiển thị'),
              onChanged: (value) {
                setState(() {
                  displayName = value;
                });
              },
              controller: TextEditingController(text: displayName),
            ),
            DropdownButtonFormField<String>(
              value: gender,
              decoration: InputDecoration(labelText: 'Giới tính'),
              items: ['Nam', 'Nữ', 'Khác']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Quốc gia hoặc khu vực'),
              onChanged: (value) {
                setState(() {
                  country = value;
                });
              },
              controller: TextEditingController(text: country),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Thành phố cư trú'),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
              controller: TextEditingController(text: city),
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Các thành phố du lịch phổ biến'),
              onChanged: (value) {
                setState(() {
                  travelCities = value;
                });
              },
              controller: TextEditingController(text: travelCities),
            ),
            SizedBox(height: 20),
            Text(
              'Đừng bỏ lỡ những ưu đãi tuyệt vời gần đó',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Text(
              'Hãy để chúng tôi tạo ra trải nghiệm tuyệt vời với danh cho riêng bạn',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
