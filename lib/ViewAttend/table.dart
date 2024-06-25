

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AttendModel.dart';
import 'View_cubit.dart';
import 'View_state.dart';

//
// class StudentAttendanceScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ViewAttendCubit()..getstudents(),
//       child: Scaffold(
//         backgroundColor: Color(0xFFE5E5E5),
//         appBar: AppBar(
//           title: Text('Student Attendance'),
//         ),
//         body: BlocBuilder<ViewAttendCubit, ViewAttendState>(
//           builder: (context, state) {
//             if (state is AttendLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is AttendErrorState) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else if (state is AttendSuccessState) {
//               return _buildDataTable(state.viewModels);
//             } else {
//               return Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDataTable(List<ViewAttendence> attendances) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columns: [
//           DataColumn(label: Text('Course Name')),
//           DataColumn(label: Text('Date')),
//         ],
//         rows: attendances.map((attendance) {
//           return DataRow(cells: [
//             DataCell(Text(attendance.courseName)),
//             DataCell(Text(attendance.date)),
//           ]);
//         }).toList(),
//       ),
//     );
//   }
// }
//
// class StudentAttendanceScreen extends StatelessWidget {
//   final String token; // Accept token as a parameter
//
//   StudentAttendanceScreen({required this.token});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ViewAttendCubit()..getstudents(token),
//       child: Scaffold(
//         backgroundColor: Color(0xFFE5E5E5),
//         appBar: AppBar(
//           title: Text('Student Attendance'),
//         ),
//         body: BlocBuilder<ViewAttendCubit, ViewAttendState>(
//           builder: (context, state) {
//             if (state is AttendLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is AttendErrorState) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else if (state is AttendSuccessState) {
//               return _buildAttendanceList(state.viewModels);
//             } else {
//               return Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAttendanceList(List<ViewAttendence> attendances) {
//     return ListView.builder(
//       itemCount: attendances.length,
//       itemBuilder: (context, index) {
//         final attendance = attendances[index];
//         return ListTile(
//           title: Text(attendance.courseName),
//           subtitle: Text('Date: ${attendance.date}'),
//         );
//       },
//     );
//   }
// }

//
// class StudentAttendanceScreen extends StatelessWidget {
//   final String token;
//
//   StudentAttendanceScreen({required this.token});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ViewAttendCubit()..getstudents(token),
//       child: Scaffold(
//         backgroundColor: Color(0xFFE5E5E5),
//         appBar: AppBar(
//           title: Text('Student Attendance'),
//         ),
//         body: BlocBuilder<ViewAttendCubit, ViewAttendState>(
//           builder: (context, state) {
//             if (state is AttendLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is AttendErrorState) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else if (state is AttendSuccessState) {
//               return _buildAttendanceList(state.viewModels);
//             } else {
//               return Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAttendanceList(List<ViewAttendence> attendances) {
//     return ListView.builder(
//       itemCount: attendances.length,
//       itemBuilder: (context, index) {
//         final attendance = attendances[index];
//         return ListTile(
//           title: Text(attendance.courseName),
//           subtitle: Text('Date: ${attendance.date}'),
//         );
//       },
//     );
//   }
// }

//
// class StudentAttendanceScreen extends StatelessWidget {
//   final String token;
//
//   StudentAttendanceScreen({required this.token});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ViewAttendCubit()..getstudents(token),
//       child: Scaffold(
//         backgroundColor: Color(0xFFE5E5E5),
//         appBar: AppBar(
//           title: Text('Student Attendance'),
//         ),
//         body: BlocBuilder<ViewAttendCubit, ViewAttendState>(
//           builder: (context, state) {
//             if (state is AttendLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is AttendErrorState) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else if (state is AttendSuccessState) {
//               return _buildAttendanceTable(state.viewModels);
//             } else {
//               return Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAttendanceTable(List<ViewAttendence> attendances) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columns: [
//           DataColumn(label: Text('Course Name')),
//           DataColumn(label: Text('Date')),
//           DataColumn(label: Text('Lecture Name')),
//         //  DataColumn(label: Text('Attend')),
//         ],
//         rows: attendances.map((attendance) {
//           return DataRow(cells: [
//             DataCell(Text(attendance.courseName)),
//             DataCell(Text(attendance.date)),
//             DataCell(Text(attendance.lectureName)),
//            // DataCell(Text(attendance.attend)),
//           ]);
//         }).toList(),
//       ),
//     );
//   }
// }



class StudentAttendanceScreen extends StatelessWidget {
  final String token;

  StudentAttendanceScreen({required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewAttendCubit()..getstudents(token),
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        appBar: AppBar(
          title: Text('Student Attendance'),
        ),
        body: BlocBuilder<ViewAttendCubit, ViewAttendState>(
          builder: (context, state) {
            if (state is AttendLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is AttendErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is AttendSuccessState) {
              return _buildAttendanceTable(state.viewModels);
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildAttendanceTable(List<ViewAttendence> attendances) {
    return Center(
      child: Table(
        border: TableBorder.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[300]),
            children: [
              _buildTableCell('Course Name', isHeader: true),
              _buildTableCell('Date', isHeader: true),
              _buildTableCell('Lecture Name', isHeader: true),
     //     _buildTableCell('Attend', isHeader: true),
            ],
          ),
          for (var attendance in attendances)
            TableRow(
              children: [
                _buildTableCell(attendance.courseName),
                _buildTableCell(attendance.date),
                _buildTableCell(attendance.lectureName),
          //    _buildTableCell(attendance.attend),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}