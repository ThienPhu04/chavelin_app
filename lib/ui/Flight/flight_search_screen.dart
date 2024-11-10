import 'package:chavelin_app/ui/Flight/flight_details_screen.dart';
import 'package:flutter/material.dart';

import 'flight_page.dart';

class FlightSearchScreen extends StatefulWidget {
  @override
  _FlightSearchScreenState createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  int selectedDateIndex = 1;
  List<String> dates = [
    "T6, 11",
    "T7, 12 thg 10",
    "CN, 13",
    "T2, 14",
    "T3, 15"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TP. Hồ Chí Minh ⟶ Điện Biên Phủ'),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          // Date Selector Row
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[200],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(dates.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: selectedDateIndex == index
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Text(
                            dates[index],
                            style: TextStyle(
                              color: selectedDateIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'AED 1,260',
                            style: TextStyle(
                              color: selectedDateIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Flight List
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Number of flight options
              itemBuilder: (context, index) {
                return _buildFlightCard();
              },
            ),
          ),
          // Bottom Filters
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomButton('Ưu tiên bay thẳng'),
                _buildBottomButton('Rẻ nhất'),
                _buildBottomButton('Xếp theo'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightCard() {
    return Material(
      color: Colors
          .transparent, // Ensures no background color for the Material widget
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FlightDetailsScreen()), // Replace with actual screen
          );
          print('Flight card tapped with ripple effect!');
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.orange, size: 24),
                  SizedBox(width: 5),
                  Text('19:00',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('⟶', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 5),
                  Text('14:00 +1',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('AED 1.586',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 24),
                  Text('SGN T1',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Spacer(),
                  Text('DIN',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.airplanemode_active, color: Colors.grey, size: 18),
                  SizedBox(width: 5),
                  Text('Vietnam Airlines',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Spacer(),
                  Text('Còn lại < 5',
                      style: TextStyle(fontSize: 14, color: Colors.redAccent)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(String label) {
    return TextButton(
      onPressed: () {
        // Handle filter action
      },
      child: Text(label, style: TextStyle(color: Colors.blueAccent)),
    );
  }
}
