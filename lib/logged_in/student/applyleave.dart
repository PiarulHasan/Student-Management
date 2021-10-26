import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'applicationview.dart';



class ApplyLeave extends StatefulWidget {
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime _current = DateTime.now();
  String _datefrom=" ";
  String _dateto=" ";
  String _issue, _explain, _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //start top leave apply section
            Container(
              padding: EdgeInsets.fromLTRB(5, 40, 5, 30),
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              ),
              child: Row(
                children: <Widget>[
                  BackButton(color: Colors.white70,),
                  Text('Leave apply', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            //end top leave apply section

            //start form section
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 25,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black26
                                        )
                                    ),
                                    child: TextField(
                                      onChanged: (input){
                                        setState(() {
                                          _name = input;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter your Name",
                                        border: InputBorder.none,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          //end issue section
                          SizedBox(height: 20,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.black26
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _datefrom==" " ? Text(DateFormat("yyyy-MM-dd").format(_current),style: TextStyle(color: Colors.black54)) : Text("$_datefrom"),
                                      IconButton(
                                        icon: Icon(Icons.calendar_today, color: Colors.grey[700],),
                                        onPressed: (){
                                          DatePicker.showDatePicker(
                                            context,
                                            theme: DatePickerTheme(containerHeight: 350, backgroundColor: Colors.white,),
                                            showTitleActions: true,
                                            minTime: DateTime(_current.year, _current.month - 1, _current.day),
                                            maxTime: DateTime(_current.year, _current.month + 1, _current.day),
                                            onConfirm: (dt) {
                                              setState(() {
                                                _datefrom =dt.toString().substring(0,10);
                                              });
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //end from section
                          SizedBox(height: 20,),
                          //start To section
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.black26
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _dateto ==" " ? Text(DateFormat("yyyy-MM-dd").format(_current), style: TextStyle(color: Colors.black54),) : Text("$_dateto"),
                                      IconButton(
                                        icon: Icon(Icons.calendar_today, color: Colors.grey[700],),
                                        onPressed: (){
                                          DatePicker.showDatePicker(
                                            context,
                                            theme: DatePickerTheme(containerHeight: 350, backgroundColor: Colors.white,),
                                            showTitleActions: true,
                                            minTime: DateTime(_current.year, _current.month - 1, _current.day),
                                            maxTime: DateTime(_current.year, _current.month + 1, _current.day),
                                            onConfirm: (dt) {
                                              setState(() {
                                                _dateto =dt.toString().substring(0,10);
                                              });
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //end to section
                          SizedBox(height: 20,),
                          //start issue section
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Issue",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black26
                                        )
                                    ),
                                    child: TextField(
                                      onChanged: (input){
                                        setState(() {
                                          _issue = input;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Enter your issue",
                                        border: InputBorder.none,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          //end issue section
                          SizedBox(height: 20,),
                          //start explain section
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Explain",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black26
                                        )
                                    ),
                                    child: TextField(
                                      onChanged: (input){
                                        setState(() {
                                          _explain = input;
                                        });
                                      },
                                      maxLines: 7,
                                      decoration: InputDecoration(
                                        hintText: "Explain your issue",
                                        border: InputBorder.none,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          //end explain section
                          SizedBox(height: 50,),
                          //start submit button section
                          FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                              color: Colors.cyan,
                              onPressed: (){

                                var _currentdate = DateFormat("yyyy-MM-dd").format(_current).toString();
                                Firestore.instance.collection("leaverequest").add({
                                  "from": _datefrom,
                                  "to": _dateto,
                                  "issue": _issue,
                                  "name": _name,
                                  "explain": _explain,
                                  "currentdate": _currentdate
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplicationView()));
                              },
                              child: Text("Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              )
                          ),
                          SizedBox(height: 50,)
                          //end submit button section
                        ],
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
