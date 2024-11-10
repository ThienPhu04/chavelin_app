import 'package:chavelin_app/page/homepage_content.dart';
import 'package:chavelin_app/ui/Login/forgotpw.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithPhoneAndPassword() async {
    try {
      final phone = "+84${_phoneController.text.trim()}";
      final password = _passwordController.text.trim();

      // Xác thực bằng Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: phone + "@example.com",
        password: password,
      );

      // Đăng nhập thành công
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thành công!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomepageContent()),
      );

      // Điều hướng sang màn hình chính hoặc màn hình khác
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thất bại: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đăng nhập",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+84 ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
                hintText: 'Số điện thoại',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: 'Mật khẩu',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                ForGot(context);
              },
              child: Text(
                'Quên mật khẩu?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: signInWithPhoneAndPassword,
            child: Text('Đăng nhập'),
          ),
        ],
      ),
    );
  }
}

void ForGot(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Forgotpw()),
  );
}
