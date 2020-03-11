import 'dart:io';
import 'dart:convert';

void main() {


String template = 
'''
import 'package:flutter/widgets.dart';
class MyIcon {
s%
}
''';

String icons = 
'''
  static const IconData name% = const IconData(
    code%,
    fontFamily: 'iconfont', 
    matchTextDirection: true
  );
''';

final filePath = "./scripts/iconfont.json";
final outPath = "./lib/common/MyIcon.dart";
  try {
    File file = new File(filePath);
    var strstr = file.readAsStringSync();
    strstr = strstr.replaceAll('-', '_');
    var json = jsonDecode(strstr);
    
    String str = '';

    for(var item in json['glyphs']) {
      var code = '0x' + item['unicode'];
      var name = item['font_class'];
      str += icons.replaceFirst('name%', name).replaceFirst('code%', code);
    }
    template = template.replaceFirst('s%', str);


    File output = new File(outPath);
    output.writeAsStringSync(template);
    print('ICON已生成');
  } catch(e) {
    print(e);
  }
  
}