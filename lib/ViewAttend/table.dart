

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
//     return Center(
//       child: Table(
//         border: TableBorder.all(
//           color: Colors.black,
//           width: 1,
//           style: BorderStyle.solid,
//         ),
//         children: [
//           TableRow(
//             decoration: BoxDecoration(color: Colors.grey[300]),
//             children: [
//               _buildTableCell('Course Name', isHeader: true),
//               _buildTableCell('Date', isHeader: true),
//               _buildTableCell('Lecture Name', isHeader: true),
//      //     _buildTableCell('Attend', isHeader: true),
//             ],
//           ),
//           for (var attendance in attendances)
//             TableRow(
//               children: [
//                 _buildTableCell(attendance.courseName),
//                 _buildTableCell(attendance.date),
//                 _buildTableCell(attendance.lectureName),
//           //    _buildTableCell(attendance.attend),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTableCell(String text, {bool isHeader = false}) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//           fontSize: 16.0,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logaya/authorization.dart';

import 'AttendModel.dart';
import 'View_cubit.dart';
import 'View_state.dart';
// استيراد صفحة Autho

class StudentAttendanceScreen extends StatelessWidget {
  final String token;

  StudentAttendanceScreen({required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewAttendCubit()..getstudents(token),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 243, 243),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => autho(),
                ),
                    (route) => false,
              );
            },
          ),
          title: Row(
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/128/3125/3125856.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              Text('Student Attendance'),
            ],
          ),
        ),
        body: BlocBuilder<ViewAttendCubit, ViewAttendState>(
          builder: (context, state) {
            if (state is AttendLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is AttendErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is AttendSuccessState) {
              return _buildAttendanceTable(
                  state.viewModels,
                  Theme.of(context).appBarTheme.foregroundColor ??
                      Colors.white);
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildAttendanceTable(
      List<ViewAttendence> attendances, Color headerColor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0)!,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(200, 49, 114, 212),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    children: [
                      _buildTableCell('Course Name', headerColor,
                          isHeader: true),
                      _buildTableCell('Date', headerColor, isHeader: true),
                      _buildTableCell('Lecture Name', headerColor,
                          isHeader: true),
                    ],
                  ),
                  for (var i = 0; i < attendances.length; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: i % 2 == 0
                            ? Color.fromARGB(255, 230, 217, 217)
                            : Color.fromARGB(255, 230, 217, 217),
                        borderRadius: i == attendances.length - 1
                            ? BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                            : BorderRadius.zero,
                      ),
                      children: [
                        _buildTableCell(attendances[i].courseName,
                            Color.fromARGB(221, 0, 0, 0),
                            isLastRow: i == attendances.length - 1),
                        _buildTableCell(
                            attendances[i].date, Color.fromARGB(221, 7, 7, 7),
                            isLastRow: i == attendances.length - 1),
                        _buildTableCell(attendances[i].lectureName,
                            Color.fromARGB(221, 7, 7, 7),
                            isLastRow: i == attendances.length - 1),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, Color color,
      {bool isHeader = false, bool isLastRow = false}) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: isHeader || isLastRow
                ? BorderSide.none
                : BorderSide(color: Color.fromARGB(255, 106, 106, 106)!),
          ),
        ),
        child: Text(
            text,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: isHeader ? 18.0 : 16.0,
              color: color,
            ),
            textAlign: TextAlign.center,
           ),
       );
    }
}