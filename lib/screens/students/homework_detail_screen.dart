import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Homework.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';

class HomeWorkDetailScreen extends StatefulWidget {
  static final String id = 'HomeworkDetailsScreen';

  @override
  _HomeWorkDetailScreenState createState() => _HomeWorkDetailScreenState();
}

class _HomeWorkDetailScreenState extends State<HomeWorkDetailScreen> {
  late Homework homework;
  bool _isLoading = true;
  String attach_name = "Add Attachments";

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        homework = ModalRoute.of(context)!.settings.arguments as Homework;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : CustomScaffold(
            title: 'Assignment Details',
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xffE6EFFF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      homework.subjectName,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aim",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            homework.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Description ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            homework.description,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Due Date ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            homework.dueDate + " ,  "+ homework.dueTime,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Attachment ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/PDF.png',width: 18,height: 18,),
                              SizedBox(width: 5,),
                              Text(
                                homework.attachment,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                       FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                        );

                        if (result != null) {
                        PlatformFile file = result.files.first;
                        setState(() {
                        attach_name = file.name;
                        });

                        // print(nameofFile);
                        } else {}
                        },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_rounded,size: 16,color: Colors.grey,),
                            SizedBox(width: 5,),
                            Text(
                              "Upload",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                RoundedButton(
                  onPressed: () {},
                  title: 'Submit',
                  padding: EdgeInsets.symmetric(horizontal: 0),
                )
              ],
            ),
          );
  }
}
