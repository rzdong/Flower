
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/common/Global.dart';
import 'package:fluttertest/models/setting.dart';
import 'package:fluttertest/widgets/MyIcon.dart';

class Settings extends StatefulWidget {
  Settings(): super();

  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Settings> {

  Setting setting = Global.setting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              BotToast.showText(text: "test");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(
                MyIcon.fastforward,
              ),
            ),
          ),
        ],
      ),
      body: Scrollbar( // 显示进度条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column( 
              //动态创建一个List<Widget>  
              children: <Widget>[
                ListTile(leading: Icon(MyIcon.bag),title: Text('语言'),subtitle: Text('小标题'),onTap: (){Navigator.pushNamed(context, 'language');},),
                ListTile(leading: Icon(MyIcon.bag),title: Text('设置1'),subtitle: Text('小标题')),
                ListTile(leading: Icon(MyIcon.bag),title: Text('设置1'),subtitle: Text('小标题')),
                ListTile(leading: Icon(MyIcon.bag),title: Text('设置1'),subtitle: Text('小标题')),
              ],
            ),
          ),
        ),
      )
    );
  }

}