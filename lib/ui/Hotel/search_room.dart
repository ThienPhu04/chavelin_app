import 'package:flutter/material.dart';
import 'hotel_list.dart';

class SearchRoom extends StatefulWidget {
  const SearchRoom({super.key});

  @override
  State<SearchRoom> createState() => _SearchRoomState();
}

class _SearchRoomState extends State<SearchRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0), // Height of the AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent, // Background color of AppBar
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button and location information section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      // Back button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Date and location information
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                '10 thg 10  -  11 thg 10',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'Đà Lạt, Lâm Đồng, Việt Nam',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Spacing between sections
                // Filter and Sort section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Filter button
                      TextButton.icon(
                        onPressed: () {
                          // Handle Filter button press
                          setState(() {
                            // Update state if needed
                          });
                        },
                        icon:
                            const Icon(Icons.filter_list, color: Colors.white),
                        label: const Text(
                          'Bộ lọc',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // Sort button
                      TextButton.icon(
                        onPressed: () {
                          // Handle Sort button press
                          setState(() {
                            // Update state if needed
                          });
                        },
                        icon: const Icon(Icons.sort, color: Colors.white),
                        label: const Text(
                          'Xếp theo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Main content with HotelList
      body: Center(
        child: HotelList(
          hotels: [
            // Sample hotel data (usually fetched from an API)
            Hotel(
              name: 'Ánh Phương Hotel Đà Lạt',
              rating: 4.1,
              imageUrl: 'https://via.placeholder.com/150',
              originalPrice: 476233,
              discountedPrice: 209597,
              discountPercent: 54,
            ),
            Hotel(
              name: 'Khách sạn Hương Sen',
              rating: 4.5,
              imageUrl: 'https://via.placeholder.com/150',
              originalPrice: 500000,
              discountedPrice: 250000,
              discountPercent: 50,
            ),
          ],
        ),
      ),
    );
  }
}
