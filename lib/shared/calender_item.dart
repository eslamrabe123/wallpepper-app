// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class MyCalendar extends StatefulWidget {
//   @override
//   _MyCalendarState createState() => _MyCalendarState();
// }
//
// class _MyCalendarState extends State<MyCalendar> {
//   late CalendarFormat _calendarFormat;
//   late DateTime _selectedDay;
//   late DateTime _focusedDay;
//
//   @override
//   void initState() {
//     super.initState();
//     _calendarFormat = CalendarFormat.month;
//     _selectedDay = DateTime.now();
//     _focusedDay = DateTime.now();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50.h,
//           ),
//           TableCalendar(
//             headerStyle: const HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//             ),
//             firstDay: DateTime.utc(2010, 1, 1),
//             lastDay: DateTime.utc(2030, 1, 1),
//             calendarFormat: _calendarFormat,
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) {
//               return isSameDay(_selectedDay, day);
//             },
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//           ),
//           SizedBox(
//             height: 50.h,
//           ),
//           Text(
//             'selected day is : ${_selectedDay.day} - ${_selectedDay.month} - ${_selectedDay.year}',
//           )
//         ],
//       ),
//     );
//   }
// }
