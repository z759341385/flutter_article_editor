/*
 * @Author: zhc
 * @Date: 2020-11-11 00:19:51
 * @LastEditTime: 2020-11-11 01:09:32
 * @Description: 
 * @LastEditors: zhc
 */
import 'dart:async';

import 'dart:math';

import 'package:flutter_article_editor/model/Model.dart';

class ComponentStream {
 static ComponentModel comModel =  ComponentModel()
    ..type = 'title_main'
    ..value = '我是标题';
  static List<ComponentModel> componentList = [comModel];
  static StreamController<List<ComponentModel>> componentController =
      StreamController<List<ComponentModel>>();
  void init() {
    componentController = StreamController<List<ComponentModel>>.broadcast();
  }

  void dispose() {
    componentController.close();
  }

  static addTextItem() {
    ComponentModel comModel = new ComponentModel()
      ..type = 'text'
      ..value = '${Random().nextInt(10)}';
    componentList.add(comModel);
    componentController.sink.add(componentList);
  }
}
