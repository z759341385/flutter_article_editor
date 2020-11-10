/*
 * @Author: zhc
 * @Date: 2020-11-08 18:29:17
 * @LastEditTime: 2020-11-11 00:52:05
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:flutter/material.dart';

class ItemModel {
  String title;
  IconData icon;
  ItemModel(this.title, this.icon);
}
class ComponentModel{
  String title;
  String type;
  Widget  widget;
  dynamic value;
  ComponentModel({this.title, this.type, this.widget,this.value});
}