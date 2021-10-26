import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class ApplicationView extends StatefulWidget {
  @override
  _ApplicationViewState createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(5, 60, 30, 50),
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
                      Expanded(child: Text('Apply', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: FlatButton.icon(
                            label: Text('Log Out', style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
                            icon: Icon(Icons.exit_to_app, color: Colors.cyan, size: 15,),
                            onPressed: () async {

                            }

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 130, 40, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(51, 204, 255, 0.3),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    )],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.5),
                    child: Text(
                      "Student Name",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  offset: Offset(0, 1.3),
                )],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Apply Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan
                    ),
                  ),
                  Text("Schedule",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  Text("Apply",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),

                ],
              )
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection("leaverequest").snapshots(),
                builder: (context, snapshot){
                  if (!snapshot.hasData){
                    return Text("loading");
                  }
                  final _leaverequestdata = snapshot.data.documents;
                  List<Widget> leaveapplyviewWidgets = [];
                  for (var i in _leaverequestdata){
                    final leaveapplyviewWidget = Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [BoxShadow(
                            color: Colors.black38,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>ApprovedPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(i.data["currentdate"],
                                style: TextStyle(
                                    color: Colors.cyan
                                ),
                              ),
                              Text(i.data["from"]+"\n"+i.data["to"],
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              ),
                              Icon(Icons.check_circle_outline,color: Colors.green,),

                            ],
                          ),
                        )
                    );
                    leaveapplyviewWidgets.add(leaveapplyviewWidget);
                  }
                  return Column(
                      children: leaveapplyviewWidgets
                  );

                }
            ),
          )
        ],
      ),
    );
  }
}
