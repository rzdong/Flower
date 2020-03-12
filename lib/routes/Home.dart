
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertest/common/Global.dart';
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
    Future.delayed(Duration(seconds: 2), () {
      _showNotification();
    });
  }

  Future _showNotification() async {
    //安卓的通知配置，必填参数是渠道id, 名称, 和描述, 可选填通知的图标，重要度等等。
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    //IOS的通知配置
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    //显示通知，其中 0 代表通知的 id，用于区分通知。
    Global.context = context;
    await Global.flutterNotificationShow(
        0, 'title', 'content', platformChannelSpecifics,
        payload: "complete", context: context);
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
              _showNotification();
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