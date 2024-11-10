import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'confirm.dart';

class Forgotpw extends StatefulWidget {
  const Forgotpw({super.key});

  @override
  State<Forgotpw> createState() => _ForgotpwState();
}

class _ForgotpwState extends State<Forgotpw> {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quên mật khẩu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Vui lòng nhập số điện thoại",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10),
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
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Bạn chưa nhận được mã ? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Gửi lại mã',
                    style: const TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                    recognizer: _tapGestureRecognizer..onTap = () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
            //Continue
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  conFirm_(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Tiếp tục',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void conFirm_(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ConfirmScreen()),
  );
}
