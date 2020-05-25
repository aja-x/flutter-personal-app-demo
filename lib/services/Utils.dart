import 'package:flutter/material.dart';

class Utils {
  static List<Text> listToTextWidget(List<Object> items, TextAlign textAlign) {
    List<Text> result = <Text>[];
    for (Object item in items) {
      result.add(Text(item.toString(), textAlign: textAlign,));
    }
    return result;
  }
  static List<Text> listToTextWidget2(List<String> titles, List<Object> items, TextAlign textAlign) {
    List<Text> result = <Text>[];
    for (int i = 0; i < titles.length; i++) {
      result.add(Text(titles[i] + ': ' + items[i].toString(), textAlign: textAlign,));
    }
    return result;
  }
}