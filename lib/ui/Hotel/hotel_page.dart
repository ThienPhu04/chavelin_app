import 'package:chavelin_app/ui/Hotel/search_room.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  DateTimeRange? selectedDateRange;
  int roomCount = 1; // Số phòng mặc định
  int adultCount = 1; // Số người lớn mặc định
  int childCount = 0; // Số trẻ em mặc định

  void _incrementRoom() {
    setState(() {
      roomCount++;
    });
  }

  void _decrementRoom() {
    if (roomCount > 1) {
      setState(() {
        roomCount--;
      });
    }
  }

  void _incrementAdult() {
    setState(() {
      adultCount++;
    });
  }

  void _decrementAdult() {
    if (adultCount > 1) {
      setState(() {
        adultCount--;
      });
    }
  }

  void _incrementChild() {
    setState(() {
      childCount++;
    });
  }

  void _decrementChild() {
    if (childCount > 0) {
      setState(() {
        childCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Chiều cao tùy chỉnh cho AppBar
        child: AppBar(
          title: Text("Chỗ ở"),
          backgroundColor: Colors.cyan,
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/image/img.png', // Đường dẫn tới hình ảnh
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black12, // Màu nền của Container
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // Trường tìm kiếm
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Nhập chỗ cần tìm',
                              prefixIcon: Icon(
                                  Icons.search), // Thêm biểu tượng tìm kiếm
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Khoảng cách giữa các phần tử
                      ],
                    ),
                    SizedBox(height: 20), // Khoảng cách giữa các phần tử
                    // Chọn ngày
                    GestureDetector(
                      onTap: () async {
                        // Hiển thị trình chọn ngày
                        DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                          initialDateRange: selectedDateRange,
                        );

                        if (picked != null) {
                          setState(() {
                            selectedDateRange = picked;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 20),
                              SizedBox(width: 8),
                              Text(
                                selectedDateRange != null
                                    ? '${selectedDateRange!.start.day}/${selectedDateRange!.start.month} - ${selectedDateRange!.end.day}/${selectedDateRange!.end.month}'
                                    : 'Chọn ngày',
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Text(
                            selectedDateRange != null
                                ? '${selectedDateRange!.duration.inDays} đêm'
                                : '0 đêm',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Khoảng cách giữa các phần tử
                    // Lựa chọn số người
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCountSelector(
                          label: 'Phòng',
                          count: roomCount,
                          increment: _incrementRoom,
                          decrement: _decrementRoom,
                        ),
                        _buildCountSelector(
                          label: 'Người lớn',
                          count: adultCount,
                          increment: _incrementAdult,
                          decrement: _decrementAdult,
                        ),
                        _buildCountSelector(
                          label: 'Trẻ em',
                          count: childCount,
                          increment: _incrementChild,
                          decrement: _decrementChild,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.change_circle_rounded),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            // Hiển thị BottomSheet khi nhấn vào Row
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return FilterBottomSheet(
                                  onApplyFilters: (double budget,
                                      String? priceRange,
                                      List<bool> starRatings) {
                                    // Xử lý kết quả lọc ở đây
                                    print("Ngân sách: $budget");
                                    print("Giá: $priceRange");
                                    print("Xếp hạng sao: $starRatings");
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          child: Text("Giá, xếp hạng",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchRoom()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Tìm kiếm',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/image/img_2.png'), // Đường dẫn tới hình ảnh
                    fit: BoxFit.cover, // Cách hiển thị hình ảnh
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Khách sạn cao cấp",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(Icons.map),
                          SizedBox(width: 8),
                          Text("Đà Lạt"),
                        ],
                      ),
                    ),
                    Container()
                  ],
                )),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Text("Vì sao nên đặt chỗ qua Travelin"),
                    Row(
                      children: [
                        Icon(Icons.heart_broken_sharp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Căn trái cho văn bản
                          children: [
                            Text(
                              "Chúng tôi khớp giá",
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Làm đậm tiêu đề
                                fontSize:
                                    18, // Kích thước chữ lớn hơn cho tiêu đề
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Khoảng cách giữa tiêu đề và đoạn văn
                            // Sử dụng Container hoặc SizedBox để giới hạn chiều rộng
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width -
                                    70, // Giới hạn chiều rộng
                              ),
                              child: Text(
                                "Chúng tôi mong muốn đề xuất cho bạn giá tốt nhất có thể. "
                                "Nếu bạn tìm thấy lựa chọn tốt hơn ở nơi khác, chúng tôi có thể hoàn tiền "
                                "chênh lệch cho bạn.",
                                maxLines: 3,
                                overflow: TextOverflow
                                    .ellipsis, // Thêm ellipsis nếu cần
                                style: TextStyle(
                                  fontSize: 14, // Kích thước chữ cho đoạn văn
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.currency_bitcoin),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Căn trái cho văn bản
                          children: [
                            Text(
                              "Nhận Thưởng Khi Đi Du Lịch",
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Làm đậm tiêu đề
                                fontSize:
                                    18, // Kích thước chữ lớn hơn cho tiêu đề
                              ),
                            ),
                            SizedBox(
                                height:
                                    8), // Khoảng cách giữa tiêu đề và đoạn văn
                            // Sử dụng Container hoặc SizedBox để giới hạn chiều rộng
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width -
                                    70, // Giới hạn chiều rộng
                              ),
                              child: Text(
                                "Nhận phần thưởng để tiết kiệm khi ban đặt chỗ và tiết "
                                "kiệm cho các chuyến đi trong tương lai",
                                maxLines: 2,
                                overflow: TextOverflow
                                    .ellipsis, // Thêm ellipsis nếu cần
                                style: TextStyle(
                                  fontSize: 14, // Kích thước chữ cho đoạn văn
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountSelector({
    required String label,
    required int count,
    required VoidCallback increment,
    required VoidCallback decrement,
  }) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: decrement,
            ),
            Text('$count', style: TextStyle(fontSize: 20)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: increment,
            ),
          ],
        ),
      ],
    );
  }

  Widget _itemHotelRecommend() {
    return Column(
      children: [Image(image: AssetImage('assets/iamge/img.png'))],
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  final Function(double budget, String? priceRange, List<bool> starRatings)
      onApplyFilters;

  FilterBottomSheet({required this.onApplyFilters});

  @override
  Widget build(BuildContext context) {
    double currentSliderValue = 2500000;
    String? selectedPriceRange;
    List<bool> starRatings = [false, false, false, false, false];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Lọc theo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text('Ngân sách (Giá phòng mỗi đêm)'),
          Slider(
            value: currentSliderValue,
            min: 0,
            max: 2500000,
            divisions: 10,
            label: currentSliderValue.round().toString() + 'đ',
            onChanged: (double value) {
              currentSliderValue = value; // Cập nhật giá trị ngân sách
            },
          ),
          Text('0đ - ${currentSliderValue.round()}đ+'),
          Column(
            children: [
              RadioListTile<String>(
                title: Text('0đ - 300.000đ'),
                value: '0-300k',
                groupValue: selectedPriceRange,
                onChanged: (value) {
                  selectedPriceRange = value; // Cập nhật lựa chọn giá
                },
              ),
              RadioListTile<String>(
                title: Text('300.000đ - 500.000đ'),
                value: '300k-500k',
                groupValue: selectedPriceRange,
                onChanged: (value) {
                  selectedPriceRange = value; // Cập nhật lựa chọn giá
                },
              ),
              RadioListTile<String>(
                title: Text('500.000đ - 800.000đ'),
                value: '500k-800k',
                groupValue: selectedPriceRange,
                onChanged: (value) {
                  selectedPriceRange = value; // Cập nhật lựa chọn giá
                },
              ),
              RadioListTile<String>(
                title: Text('800.000đ - 1.400.000đ'),
                value: '800k-1400k',
                groupValue: selectedPriceRange,
                onChanged: (value) {
                  selectedPriceRange = value; // Cập nhật lựa chọn giá
                },
              ),
              RadioListTile<String>(
                title: Text('1.400.000đ - 2.500.000đ'),
                value: '1400k-2500k',
                groupValue: selectedPriceRange,
                onChanged: (value) {
                  selectedPriceRange = value; // Cập nhật lựa chọn giá
                },
              ),
              RadioListTile<String>(
                title: Text('> 2.500.000đ'),
                value: '>2500k',
                groupValue: selectedPriceRange,
                onChanged: (value) {
                  selectedPriceRange = value; // Cập nhật lựa chọn giá
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Xếp Hạng Sao'),
          Column(
            children: List.generate(5, (index) {
              return CheckboxListTile(
                title: Text('${(index + 1)}+'),
                value: starRatings[index],
                onChanged: (bool? value) {
                  starRatings[index] = value!; // Cập nhật giá trị xếp hạng
                },
              );
            }),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Gọi callback khi nhấn nút "Xem kết quả"
              onApplyFilters(
                  currentSliderValue, selectedPriceRange, starRatings);
            },
            child: Text('Xem kết quả'),
          ),
        ],
      ),
    );
  }
}
