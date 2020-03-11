
import 'package:flutter/widgets.dart';

class Browser extends StatefulWidget {
  Browser(): super();

  @override
  BrowserState createState() => BrowserState();
}

class BrowserState extends State<Browser> {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text("Browser"),
    );
  }

}