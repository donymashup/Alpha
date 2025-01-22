import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarSchedulePage extends StatefulWidget {
  @override
  _CalendarSchedulePageState createState() => _CalendarSchedulePageState();
}

class _CalendarSchedulePageState extends State<CalendarSchedulePage> {
  DateTime selectedDate = DateTime(2025, 1, 24); // January 24, 2025

  final List<Map<String, dynamic>> scheduleItems = [
    {
      'icon': Icons.play_circle_outline,
      'iconColor': AppConstant.orangedot,
      'title': 'Crop Production',
      'subtitle': 'Videos',
      'time': '3:36:46 PM',
    },
    {
      'icon': Icons.list,
      'iconColor': AppConstant.bluedot,
      'title': 'Alphabet Test',
      'subtitle': 'Practice Tests',
      'time': '7:07:23 AM',
    },
    {
      'icon': Icons.bookmark,
      'iconColor': AppConstant.reddot,
      'title': 'Blood Relation (SB)',
      'subtitle': 'Materials',
      'time': '8:15:17 AM',
    },
  ];

  List<DateTime> _generateWeekDays() {
    final DateTime startDate = DateTime(2025, 1, 21); // January 21, 2025
    List<DateTime> days = [];
    for (int i = 0; i < 7; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppConstant.titlecolor),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd').format(selectedDate),
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('EEE').format(selectedDate),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(
                          DateFormat('MMM yyyy').format(selectedDate),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F7F1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                        color: Color(0xFF4CD080),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Week Calendar
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13), // 0.05 * 255 = 12.75, rounded to 13
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _generateWeekDays().map((date) {
                    bool isSelected = date.day == selectedDate.day;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            DateFormat('E').format(date)[0],
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFFFF7F57) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),

              // Schedule Items
              ...scheduleItems.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13), // 0.05 * 255 = 12.75, rounded to 13
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item['icon'],
                        color: item['iconColor'],
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                color: item['iconColor'],
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subtitle'],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  item['time'],
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}