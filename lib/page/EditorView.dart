/*
 * @Author: zhc
 * @Date: 2020-11-08 16:37:13
 * @LastEditTime: 2020-11-11 01:09:51
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_article_editor/const/style.dart';
import 'package:flutter_article_editor/model/Model.dart';
import 'package:flutter_article_editor/stream/ComponentStream.dart';
import 'package:flutter_article_editor/widget/AddIcon.dart';
import 'package:flutter_article_editor/widget/EditComponent.dart';

class EditorView extends StatefulWidget {
  @override
  _EditorViewState createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  FocusNode _titleNode = FocusNode();
  FocusNode blankNode = FocusNode();
  List<ComponentModel> _contentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initContentList();
  }

  _initContentList() {
    ComponentModel clip = ComponentModel()
      ..title = '主标题'
      ..type = 'title_main'
      ..widget = _buildMainTitleWidget();

    _contentList.add(clip);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(blankNode);
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    ComponentModel comModel = new ComponentModel()
      ..type = 'title_main'
      ..value = '我是标题'
    ;
    return StreamBuilder<List<ComponentModel>>(
        stream: ComponentStream.componentController.stream,
        initialData: [comModel],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildContentItem(snapshot.data,index);
            },
            itemCount: snapshot.data.length,
          );
        });
  }

  _buildContentItem(List list ,int index) {
    Widget widget;
    switch (list[index].type) {
      case 'title_main':
        widget = _buildMainTitleWidget();
        break;
      case 'text':
        widget = EditComponent.editTextComponent();
        break;
      default:
    }
    return Container(
      child: Column(
        children: [
          widget,
          AddIcon(),
        ],
      ),
    );
  }

  Container _buildMainTitleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      height: 60,
      width: double.maxFinite,
      color: Colors.white,
      child: TextField(
          cursorColor: CustomStyle.cursorColor,
          decoration: InputDecoration(
              border: CustomStyle.customOutbor,
              enabledBorder: CustomStyle.customOutbor,
              focusedBorder: CustomStyle.customOutbor,
              hintText: '点击输入文章标题',
              suffixIcon: Icon(Icons.text_format))),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0,
      leading: Container(
        width: 80,
        alignment: Alignment.center,
        child: Text(
          '取消',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '编辑',
            style: TextStyle(color: Colors.black),
          ),
          Icon(
            Icons.help_outline,
            color: Colors.black,
          )
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            print('123');
            // ComponentStream.addItem();
          },
          child: Container(
            height: 40,
            width: 80,
            alignment: Alignment.center,
            child: Container(
              height: 30,
              width: 65,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.blue[500],
              ),
              child: Text('预览', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    );
  }
}
