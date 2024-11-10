import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeSent = false; // Biến trạng thái để kiểm soát việc gửi lại mã

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Xác nhận số điện thoại",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                hintText: 'Nhập mã xác nhận',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.number, // Bàn phím số để nhập mã
            ),
            SizedBox(height: 10),

            // Row for "Resend code" text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Bạn chưa nhận được mã?",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                TextButton(
                  onPressed: _isCodeSent
                      ? null // Disable button if code already sent
                      : () {
                          setState(() {
                            _isCodeSent = true;
                          });
                          // Thêm logic gửi lại mã ở đây, ví dụ gọi API gửi mã
                        },
                  child: Text(
                    _isCodeSent ? "Đã gửi mã" : "Gửi lại mã",
                    style: TextStyle(
                      color: _isCodeSent ? Colors.grey : Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            //Continue
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Implement search action here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
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
