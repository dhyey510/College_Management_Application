import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';

class GalleryScreen extends StatelessWidget {
  static final String id = 'GalleryScreen';

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Gallery';
  }

  final List<StaggeredTile> _cardTile = <StaggeredTile>[
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
  ];
  bool _isLoading =false;

//List of Cards with color and icon
  final List<Widget> _listTile = <Widget>[
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery1.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/gallery2.jpg"),
          fit: BoxFit.fill,
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      // child: Image.asset("assets/images/gallery2.jpg", fit: BoxFit.fill,),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery3.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery1.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery2.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery3.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery1.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/gallery2.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              margin: EdgeInsets.only(top: 20),
              child: StaggeredGridView.count(
                crossAxisCount: 4,
                staggeredTiles: _cardTile,
                children: _listTile,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          );
  }
}
