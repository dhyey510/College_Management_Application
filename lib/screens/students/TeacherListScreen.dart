import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class TeacherListScreen extends StatelessWidget {
  static final String id = 'TeacherListScreen';

  const TeacherListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Teachers List',
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 75.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Akshay Desai',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                'abc@gmail.com',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  //color: Colors.lightBlueAccent,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6EFFF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Data Science',
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Color(0xff3f4094),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
