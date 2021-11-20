import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class PrincipalDeskScreen extends StatelessWidget {
  static final String id = 'PrincipalDeskScreen';

  const PrincipalDeskScreen({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage:
                        AssetImage('assets/images/parthsir.webp'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Dr. Parth Shah",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Source Sans Pro",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "For any support request regards your acedemic performance or any reasons please feel free to speak with me at below.",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Source Sans Pro",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _launchUrl('tel: +91 9876543210'),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.blue.shade100,
                            child: Icon(
                              Icons.phone,
                              size: 35.0,
                              color: Colors.blue.shade900,
                            )),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _launchUrl('mailto: parthshah.ce@charusat.ac.in'),
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.yellow.shade100,
                            child: Icon(
                              Icons.email_rounded,
                              size: 35.0,
                              color: Colors.yellow.shade900,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        title: "Head Of Department");
  }
}
