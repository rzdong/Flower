
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertest/common/Global.dart';
import 'package:fluttertest/service/Weather.dart';
import 'package:fluttertest/widgets/MyIcon.dart';


enum HeaderStatus {
  hide,
  showNoBG,
  showBG
}



class TimeType {

  TimeType({
    @required this.type,
    @required this.bgColor,
    @required this.headerColor,
    @required this.startColor,
  });

  final String type;
  final Color bgColor;
  final Color headerColor;
  final Color startColor;
}

class WeatherData {
  WeatherData({
    this.icon,
    this.day,
    this.weather,
    this.quality,
    this.topWeather,
    this.bottomWeather,
  });
  final Icon icon;
  final String day;
  final String weather;
  final String quality;
  final int topWeather;
  final int bottomWeather;
}





class Home extends StatefulWidget {
  Home(): super();

  @override
  HomeState createState() => HomeState();
}



class HomeState extends State<Home> {

  dynamic home;

  HeaderStatus statusHeader = HeaderStatus.showNoBG;

  ScrollController _controller = new ScrollController();

  int scrollOffset = 0;

  bool showDialog = false;

  final Map<String, TimeType> timeTypeList = {
    'morning': TimeType(type: 'morning', bgColor: Color(0xff6d8eea), headerColor: Color(0xffffd2df), startColor: Color(0xffffd0d2)),
    'noon': TimeType(type: 'noon', bgColor: Color(0xff5d8eea), headerColor: Color(0xff6d8eea), startColor: Color(0xffc2dafd)),
    'afternoon': TimeType(type: 'afternoon', bgColor: Colors.lime[900], headerColor: Colors.orangeAccent[200], startColor: Colors.red[400]),
    'night': TimeType(type: 'night', bgColor: Colors.blueGrey[800], headerColor: Colors.grey[900], startColor: Colors.black),
  };

  List<WeatherData> weatherList = [
    WeatherData(icon: Icon(Icons.cloud, color: Colors.white,), day: '今天', weather: '阴', quality: '优', topWeather: 18, bottomWeather: 12),
    WeatherData(icon: Icon(Icons.grain, color: Colors.white,), day: '明天', weather: '阴转小雨', quality: '优', topWeather: 19, bottomWeather: 12),
    WeatherData(icon: Icon(Icons.wb_sunny, color: Colors.white,), day: '后天', weather: '晴', quality: '优', topWeather: 17, bottomWeather: 12),
  ];

  String timeType = 'morning';

  @override
  void initState() {
    super.initState();
    // init();
    _controller.addListener(() {
      int offset = _controller.offset.round();
      if (offset > scrollOffset) {
        setState(() {
          statusHeader = HeaderStatus.hide;
        });
      } else if (offset < scrollOffset) {
        if (offset < 400) {
          setState(() {
            statusHeader = HeaderStatus.showNoBG;
          });
        } else {
          setState(() {
            statusHeader = HeaderStatus.showBG;
          });
        }
      }
      
      scrollOffset = offset;
    });
    Future.delayed(Duration(seconds: 3), () {
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

  void showDialogCB() {
    setState(() {
      showDialog = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: timeTypeList[timeType].bgColor,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: null,
            controller: _controller,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 500,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,colors:[timeTypeList[timeType].startColor, timeTypeList[timeType].bgColor])
                          ),
                          width: double.infinity,
                          height: 500,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 90),
                          width: double.infinity,
                          child: Column(mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text("18", style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.none
                              )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Text("℃", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.none
                                )),
                                Icon(Icons.music_note, size: 18, color: Colors.white70,),
                              ],)
                            ],),
                            Padding(padding: EdgeInsets.only(left: 10.0),child: Text("阴", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none
                            )),)
                          ],),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.infinity,
                    child: Column(children: <Widget>[
                      Row(children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(child: Text('1', style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none
                          )
                        ),),
                        ),
                        Container(
                          height: 16.0,
                          width: 2.0,
                          color: Colors.white,
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(child: Text('1', style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none
                          )
                        ),),
                        ),
                      ],),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 65.0 *4 -15,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Column(
                          children: [
                            WeatherItem(watherData: weatherList[0]),
                            WeatherItem(watherData: weatherList[1]),
                            WeatherItem(watherData: weatherList[2]),
                            GestureDetector(
                              onTap: () {
                                String type = 'morning';
                                switch (timeType) {
                                  case 'morning':
                                    type = 'noon';
                                    break;
                                  case 'noon':
                                    type = 'afternoon';
                                    break;
                                  case 'afternoon':
                                    type = 'night';
                                    break;
                                  case 'night':
                                    type = 'morning';
                                    break;
                                  default:
                                }

                                setState(() {
                                  timeType = type;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45.0,
                                width: double.infinity,
                                child: Text('查看更多', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.none
                                  )
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 65.0 *3,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Column(
                          children: [
                            
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 65.0 *3,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Column(
                          children: [
                            
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 65.0 *4,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Column(
                          children: [
                            
                          ]
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        width: double.infinity,
                        child: Text("—— 到底了 ——", style: 
                          TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none
                          )
                        )
                      )
                    ],),
                  )
                ],
              )
            )
          ),
          AppHeader(status: statusHeader, showDialogCB: showDialogCB, color: timeTypeList[timeType].headerColor),

          showDialog ? GestureDetector(
            onTap: () {
              setState(() {
                showDialog = false;
              });
            },
            child: Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 10.0, 0),
              color: Color(0x55000000),
              child: Material(child: 
              
                Container(
                  width: 200.0,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(leading: Text("设置"), onTap: () {
                    Navigator.pushNamed(context, 'settings');
                  },),
                  ListTile(leading: Text("反馈")),
                  ListTile(leading: Text("分享"))
                ]
              ),),)
            ),
          ) : Container(),
        ],
      ),
    );
    
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('hello'),
    //     actions: <Widget>[
    //       InkWell(
    //         onTap: () {
    //           BotToast.showText(text: "test");
    //           _showNotification();
    //         },
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 15.0),
    //           child: Icon(
    //             MyIcon.airplay,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: Center(
    //     child: Column(
    //       children: <Widget>[
    //         RaisedButton(
    //           child: Text('清除language'),
    //           onPressed: () {
    //             Provider.of<SettingModel>(context, listen: false).language = null;
    //           },
    //         ),
    //         RaisedButton(
    //           child: Text('去设置页'),
    //           onPressed: () {
    //             Navigator.pushNamed(context, 'settings');
    //           },
    //         ),
    //         Text(home ?? ''),
    //         Consumer<SettingModel>(
    //           builder: (BuildContext context, settingModel, Widget child) {
    //             return Text(settingModel.language ?? "null");
    //           },
    //         )
            
    //       ],
    //     ),
    //   ),
    // );
  }

}

final double appHeaderHeight = 48.0;

class AppHeader extends StatefulWidget {
  AppHeader({
    Key key,
    this.status,
    this.color,
    this.showDialogCB,
  }): super(key: key);

  final HeaderStatus status;
  final Color color;
  final Function showDialogCB;

  @override
  AppHeaderState createState() => AppHeaderState();
}
class AppHeaderState extends State<AppHeader> {


  double opacityLevel = 0;
  double opacityLevel2 = 0;

  @override
  void didUpdateWidget(oldWidget){
    super.didUpdateWidget(oldWidget);
    switch (widget.status) {
      case HeaderStatus.showBG:
        setState(() {
          opacityLevel = 1.0;
          opacityLevel2 = 1.0;
        });
        break;
      case HeaderStatus.showNoBG:
        setState(() {
          opacityLevel = 0.0;
          opacityLevel2 = 0.0;
        });
        break;
      case HeaderStatus.hide:
        setState(() {
          opacityLevel = 1.0;
          opacityLevel2 = 1.0;
        });
        break;
      default:
    }
    
  }

  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    print(widget.status);
    return Container(
      width: double.infinity,
      
      child: Column(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return FadeTransition(child: child, opacity: animation);
            },
            child: widget.status == HeaderStatus.hide ? Container(key: ValueKey<int>(3)) : AnimatedOpacity(
              key: ValueKey<int>(4),
              duration: Duration(milliseconds: 100),
              opacity: opacityLevel,
              child: Container(
                width: double.infinity,
                height: statusBar,
                color: widget.color,
              )
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return FadeTransition(child: child, opacity: animation);
            },
            child: widget.status == HeaderStatus.hide ? Container(
              key: ValueKey<int>(1)
            ) : Container(
              key: ValueKey<int>(2),
              width: double.infinity,
              height: appHeaderHeight,
              child: Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 100),
                    opacity: opacityLevel2,
                    child: Container(
                      width: double.infinity,
                      height: appHeaderHeight,
                      color: widget.color,
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "citymanager");
                        },
                        child: Container(
                          width: appHeaderHeight,
                          height: appHeaderHeight,
                          alignment: Alignment.center,
                          child: Icon(MyIcon.plus, color: Colors.white,),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: appHeaderHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("重庆市 江北区", style: 
                              TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.none
                              )
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.cloud_queue, size: 12, color: Colors.white,),
                                Text('刚刚更新',style: 
                                  TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.none
                                  )
                                )
                              ]
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, "citymanager");
                          widget.showDialogCB();
                        },
                        child: Container(
                          width: appHeaderHeight,
                          height: appHeaderHeight,
                          alignment: Alignment.center,
                          child: Icon(MyIcon.ellipsis, color: Colors.white,),
                        ),
                      )
                    ]
                  ),
                ],
              )
              
              
            )
          ),
          
        ]
      )
      
      
      
      
    );
  }
}

class WeatherItem extends StatelessWidget {

  WeatherItem({
    Key key,
    this.watherData,
  }): super(key: key);

  final WeatherData watherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Row(
              children: <Widget>[
                watherData.icon,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(watherData.day + '·' + watherData.weather, style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none
                  )),
                ),
                Container(
                  height: 16,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Text(watherData.quality, style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none
                  ))
                )
              ],
            ),
          ),
          Text(watherData.topWeather.toString() + '°' + ' / ' + watherData.bottomWeather.toString() + '°', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.none
          )),
        ]
      ),
    );
    
  }
}