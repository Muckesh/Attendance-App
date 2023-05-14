import 'package:attendance/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> TimeTable = {
      "8:30 AM - 9:20 AM": "EMF",
      "9:20 AM - 10:10 AM": "LIC",
      "10:20 AM - 11:10 AM": "CS",
      "11:35 AM - 12:15 PM": "MPMC",
      "12:15 PM - 1:35 PM": "PRP",
      "1:35 PM - 2:15 PM": "UHV",
      "2:15 PM - 3:05 PM": "LAB",
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // "Hi ${user?.displayName ?? 'User'},",
                  "Hi Student,",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attendance Percentage',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '97%',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Today's Schedule",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                // List view

                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: TimeTable.length,
                    itemBuilder: (context, int index) {
                      return ScheduleContainer(
                        hour: TimeTable.keys.elementAt(index),
                        hourName: TimeTable.values.elementAt(index),
                      );
                    }),
                // Container(
                //     decoration: BoxDecoration(
                //       color: Colors.deepPurple[400],
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Column(
                //       children: [
                //         SizedBox(height: 10),
                //         ScheduleContainer(),
                //         Divider(
                //           height: 10,
                //           color: Colors.white,
                //         ),
                //         ListTile(
                //           leading: Icon(Icons.schedule, color: Colors.white),
                //           title: Text(
                //             '11:00 AM - 12:30 PM',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white,
                //             ),
                //           ),
                //           subtitle: Text(
                //             'Physics',
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScheduleContainer extends StatelessWidget {
  final String hour;
  final String hourName;
  const ScheduleContainer({
    required this.hour,
    required this.hourName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(Icons.schedule, color: Colors.white),
          title: Text(
            hour,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            hourName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
