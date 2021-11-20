import 'package:cspit_sgp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentList.dart';
import 'package:cspit_sgp/models/Faculty.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacultyMainMenu extends StatefulWidget {

  @override
  State<FacultyMainMenu> createState() => _FacultyMainMenuState();
}

class _FacultyMainMenuState extends State<FacultyMainMenu> {
  Faculty currentFaculty=Faculty();

  Future<Faculty> getData() async{
    currentFaculty=await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid, isStudent: false).currentFaculty;
    return currentFaculty;
  }

  @override
  Widget build(BuildContext context) {
    List otherClasses=['7IT1','7IT2','5IT1','5IT2','3IT1','3IT2'];
    print(currentFaculty.name);

    return FutureBuilder(
      future: getData(),
      builder: (ctx,snapshot) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xff3f4094),
          ),
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
            fit: StackFit.loose,
            children: [
              // profile short
              Positioned(
                top: 0,
                left: 1,
                right: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi ${currentFaculty.name.split(' ')[0]}",
                            style: TextStyle(fontFamily: 'source sans pro',
                                fontSize: 30,
                                color: Colors.white),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.mail,
                                color: Colors.white.withOpacity(0.61),
                                size: 20,),
                              SizedBox(width: 5,),
                              Text(currentFaculty.email, style: TextStyle(
                                  fontFamily: 'source sans pro',
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.61)),),
                            ],
                          )
                        ],
                      ),
                      CircleAvatar(
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.contain,
                        ),
                        radius: 40,
                      ),
                    ],
                  ),
                ),
              ),

              // for navitems
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("All Classes", style: TextStyle(fontSize: 20,
                                fontFamily: "source sans pro",
                                fontWeight: FontWeight.w600),),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2),
                                child: Row(
                                  children: [
                                    Icon(Icons.add, color: Colors.blueAccent,
                                      size: 20,),
                                    Text("Add Class", style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // for other classes
                      Container(
                        width: double.infinity,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.56,
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 150,
                                childAspectRatio: 1,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                            itemCount: otherClasses.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      FacultyStudentList.id,
                                      arguments: {'type': false});
                                  // Navigator.of(context).pushNamed(ExamSchedule.id);
                                  print("hello");
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Color(0xfffef8ea),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xfff0ece3),
                                        blurRadius: 15.0, // soften the shadow
                                        spreadRadius: 5.0, //extend the shadow
                                        offset: Offset(
                                          5.0, // Move to right 10  horizontally
                                          5.0, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text(otherClasses[index],
                                    style: TextStyle(color: Color(0xffe9ae24),
                                        fontFamily: "source sans pro",
                                        fontSize: 28),)),
                                ),
                              );
                            }),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
}
