/*
 * @Author: zhc
 * @Date: 2020-11-08 16:36:16
 * @LastEditTime: 2020-11-08 16:56:11
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:flutter/material.dart';
import 'package:flutter_article_editor/page/EditorView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EditorView(),
    );
  }
}

