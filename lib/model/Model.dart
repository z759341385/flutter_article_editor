/*
 * @Author: zhc
 * @Date: 2020-11-08 18:29:17
 * @LastEditTime: 2020-11-08 18:33:49
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:flutter/material.dart';

class ItemModel {
  String title;
  IconData icon;
  ItemModel(this.title, this.icon);
}
class ClipModel{
  String title;
  String type;
  Widget  widget;
  dynamic value;
  ClipModel({this.title, this.type, this.widget,this.value});
}