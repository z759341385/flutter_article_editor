/*
 * @Author: zhc
 * @Date: 2020-11-08 17:11:22
 * @LastEditTime: 2020-11-08 17:18:16
 * @Description: 
 * @LastEditors: zhc
 */
// 输入框边框/圆角
import 'package:flutter/material.dart';

class CustomStyle {
  //游标颜色
  static Color cursorColor =Colors.blue[700];
  //输入框颜色
  static OutlineInputBorder customOutbor = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    // borderRadius: BorderRadius.circular(
    //   ScreenUtil().setWidth(100),
    // ),
  );
}
