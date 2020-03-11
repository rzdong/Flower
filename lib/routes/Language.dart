
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/common/SettingModel.dart';
import 'package:fluttertest/widgets/MyIcon.dart';
import 'package:provider/provider.dart';

class Language extends StatefulWidget {
  Language(): super();

  @override
  LanguageState createState() => LanguageState();
}

class LanguageState extends State<Language> {

  List<LanguageList> langlist = [
    LanguageList(code: 'zh_CN', language: '中文简体'),
    LanguageList(code: 'en_US', language: '英文'),
    LanguageList(code: null , language: '自动' )
  ];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("语言"),
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
          child: Center(
            child: Consumer<SettingModel>(
              builder: (BuildContext context, settingModel, Widget child) {
                return Column( 
                  //动态创建一个List<Widget>  
                  children: langlist.map((item) {
                    return ListTile(
                      selected: settingModel.language == item.code, 
                      title: Text(item.language), 
                      trailing: settingModel.language == item.code ? Icon(Icons.done, color: color) : null,
                      onTap: () {
                        settingModel.language = item.code;
                      });
                  }).toList()
              
                );
              },
            )
          ),
        ),
      )
    );
  }

}


class LanguageList {
  LanguageList({
    @required this.language,
    @required this.code
  });

  final String language;
  final String code;
}