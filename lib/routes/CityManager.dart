
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CityManager extends StatefulWidget {
  CityManager(): super();

  @override
  CityManagerState createState() => CityManagerState();
}

class CityManagerState extends State<CityManager> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        // alignment: Alignment.center,
        children: <Widget>[
          Text("0" * 10000),
          Center(
            child: FilterButton(
              child: Icon(Icons.cloud)
            )
          )
        ],
      )
    ,);
  }
}

class FilterButton extends StatelessWidget {

  FilterButton({
    this.child,
  }):super();

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return ClipOval( 
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: Container(
              child: child, 
              padding: EdgeInsets.all(10),
              color: Colors.red.withOpacity(0.1)
            ),
          )
    );
  }
}
