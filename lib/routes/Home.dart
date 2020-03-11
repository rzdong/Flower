
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/common/SettingModel.dart';
import 'package:fluttertest/service/Weather.dart';
import 'package:fluttertest/widgets/MyIcon.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home(): super();

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  dynamic home;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    BotToast.showLoading(); //弹出一个加载动画
    try {
      home = await Weather().getWeathre(query: {"location": "重庆"});
      setState(() {
        home = home;
      });
    } catch (error) {
      if (error.toString().contains("TIMEOUT")) {
        BotToast.showText(text:"超时，请重试");
      } else {
        BotToast.showText(text:"加载异常，请重试");
      }
      print(error);
    } finally {
      BotToast.closeAllLoading();
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              BotToast.showText(text: "test");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(
                MyIcon.airplay,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('清除language'),
              onPressed: () {
                Provider.of<SettingModel>(context, listen: false).language = null;
              },
            ),
            RaisedButton(
              child: Text('去设置页'),
              onPressed: () {
                Navigator.pushNamed(context, 'settings');
              },
            ),
            Text(home ?? ''),
            Consumer<SettingModel>(
              builder: (BuildContext context, settingModel, Widget child) {
                return Text(settingModel.language ?? "null");
              },
            )
            
          ],
        ),
      ),
    );
  }

}