import 'package:chavelin_app/ui/Login/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase
import 'firebase_options.dart'; // Đảm bảo bạn đã có firebase_options.dart từ FlutterFire CLI

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo Flutter đã được khởi tạo
  // Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Sử dụng cấu hình Firebase đã tạo từ FlutterFire CLI
  );

  runApp(MyApp()); // Chạy ứng dụng sau khi Firebase được khởi tạo
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signin(), // Truyền trang Signin làm trang chủ của ứng dụng
    );
  }
}
