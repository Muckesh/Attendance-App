import 'package:attendance/Student/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

enum Type {
  Leave,
  OD,
}

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  final TextEditingController _controllerDescription = TextEditingController();

  final TextEditingController fromdateController = TextEditingController();
  final TextEditingController todateController = TextEditingController();
  Type _type = Type.Leave;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apply Leave / OD"),

            // From Date

            SizedBox(
              height: 20,
            ),
            TextField(
              controller:
                  fromdateController, //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "From Date" //label text of field
                  ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                //when click we have to show the datepicker
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        2022), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));
                if (pickedDate != null) {
                  print(
                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(
                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(
                      formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need

                  setState(() {
                    fromdateController.text =
                        formattedDate; //set foratted date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            SizedBox(
              height: 20,
            ),

            //  To Date

            TextField(
              controller:
                  todateController, //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "To Date" //label text of field
                  ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                //when click we have to show the datepicker
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        2022), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));
                if (pickedDate != null) {
                  print(
                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(
                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(
                      formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need

                  setState(() {
                    todateController.text =
                        formattedDate; //set foratted date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            SizedBox(
              height: 20,
            ),

            // Radio Button
            Text("Type"),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: Type.Leave,
                      groupValue: _type,
                      onChanged: (Type? value) {
                        setState(() {
                          _type = value!;
                        });
                      },
                    ),
                    Text("Leave"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Type.OD,
                      groupValue: _type,
                      onChanged: (Type? value) {
                        setState(() {
                          _type = value!;
                        });
                      },
                    ),
                    Text("OD"),
                  ],
                ),
              ],
            ),
            // Reason Form
            Text("Reason:"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              minLines: 1,
              maxLines: 10, // allow user to enter max 1000 chars in textfield

              keyboardType: TextInputType
                  .multiline, // user keyboard will have a button to move cursor to next line
              controller: _controllerDescription,
              decoration: InputDecoration(
                hintText: "Reason...\n\n\n\n\n\n",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Apply Button
            GestureDetector(
              onTap: () {},
              child: Container(
                // width: double.infinity,
                alignment: Alignment.bottomCenter,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff1A54F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      color: Color(0xffFBFBFC),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
