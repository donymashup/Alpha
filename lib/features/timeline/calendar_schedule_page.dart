import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/drawermenu/services/drawer_service.dart';
import 'package:alpha/models/timeLine_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarSchedulePage extends StatefulWidget {
  @override
  _CalendarSchedulePageState createState() => _CalendarSchedulePageState();
}

class _CalendarSchedulePageState extends State<CalendarSchedulePage> {
  DateTime selectedDate = DateTime.now(); // Automatically selects today's date
  late Future<TimeLineModel?> _timeLinedata;

  @override
  void initState() {
    super.initState();
    _timeLinedata = fetchTimeLineData();
  }

   Future<TimeLineModel?> fetchTimeLineData() async {
    DrawerService drawerService = DrawerService();
    return await drawerService.getTimeLine(
        userId: '1',
        date: DateFormat('dd-MM-yyyy').format(selectedDate)
      );
  }

  List<DateTime> _generateWeekDays() {
    final DateTime startDate = DateTime.now().subtract(Duration(days: 3));
    return List.generate(5, (index) => startDate.add(Duration(days: index)));
  }

  String getDateLabel() {
    DateTime today = DateTime.now();
    if (DateFormat('yyyy-MM-dd').format(selectedDate) == DateFormat('yyyy-MM-dd').format(today)) {
      return 'Today';
    } else {
      return DateFormat('EEEE').format(selectedDate);
    }
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
        title: const Text(
          "Timeline",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppConstant.titlecolor,
          ),
        ),
        centerTitle: false,
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
                    child: Text(
                      getDateLabel(),
                      style: const TextStyle(
                        color: Color(0xFF4CD080),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Scrollable Week Calendar
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _generateWeekDays().map((date) {
                      bool isSelected = date.day == selectedDate.day &&
                          date.month == selectedDate.month &&
                          date.year == selectedDate.year;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = date;
                          });
                         _timeLinedata = fetchTimeLineData();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder<TimeLineModel?>(
                future: _timeLinedata,
                 builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.timeline == null ||
                        snapshot.data!.timeline!.isEmpty) {
                      return Center(child: Text('No Time Line available'));
                    } else {
                      final timeLineData = snapshot.data!.timeline!;
                 
                 return ListView.builder(
                  itemCount: timeLineData.length,
                  itemBuilder: 
                  (context, index) {
                     final item = timeLineData[index];
                     print(item.type);
                      IconData itemIcon;
                      Color itemColor;

                      switch (item.type) {
                      case 'vedios':
                        itemIcon = Icons.play_circle_fill;
                        itemColor = AppConstant.orangedot;
                        break;
                      case 'material':
                        itemIcon = Icons.book;
                        itemColor = AppConstant.reddot;
                        break;
                      case 'Practice Test':
                        itemIcon = Icons.list;
                        itemColor = AppConstant.bluedot;
                        break;
                      case 'Test Series':
                        itemIcon = Icons.question_mark_outlined;
                        itemColor = const Color.fromARGB(255, 0, 163, 139);
                        break;  
                      default:
                        itemIcon = Icons.insert_drive_file;
                        itemColor = Colors.grey;
                    }
                    return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        itemIcon,
                        color: itemColor,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name?? 'name',
                              style: TextStyle(
                                color: itemColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description?? 'description',
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
                                  item.time?? 'time',
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
                );
                  },
                  
                  );
                 }
                 },
                 )
            ],
          ),
        ),
      ),
    );
  }
}
