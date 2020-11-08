/*
 * @Author: zhc
 * @Date: 2020-11-08 16:37:13
 * @LastEditTime: 2020-11-08 18:50:36
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_article_editor/const/style.dart';
import 'package:flutter_article_editor/model/Model.dart';

class EditorView extends StatefulWidget {
  @override
  _EditorViewState createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  FocusNode _titleNode = FocusNode();
  FocusNode blankNode = FocusNode();
  List<ClipModel> _contentList = [];
  List<ItemModel> menuItems = [
    ItemModel('图片', Icons.crop_original),
    ItemModel('文字', Icons.text_fields),
    ItemModel('视频', Icons.movie),
    ItemModel('拼图', Icons.extension),
    ItemModel('位置', Icons.location_on),
    ItemModel('标题', Icons.title),
    ItemModel('投票', Icons.add_alert),
    ItemModel('音频', Icons.music_note),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initContentList();
  }

  _initContentList() {
    ClipModel clip = ClipModel()
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return _buildContentItem(index);
          },
          itemCount: _contentList.length,
        ),
      ),
    );
  }

  Container _buildContentItem(int index) {
    Widget widget;
    switch (_contentList[index].type) {
      case 'title_main':
        widget = _contentList[index].widget;
        break;
      case 'text':
        widget = _contentList[index].widget;
        break;
      default:
    }
    return Container(
      child: Column(
        children: [
          widget,
          _buildAddIcon(),
        ],
      ),
    );
  }

  _buildAddIcon() {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      menuBuilder: _buildLongPressMenu,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Icons.add_circle_outline,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildLongPressMenu() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 220,
        color: const Color(0xFF4C4C4C),
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: menuItems
              .map((item) => GestureDetector(
                    onTap: () {
                      print('插入￥${item.title}');
                      switch (item.title) {
                        case '文字':
                          ClipModel clip = ClipModel()
                            ..title = '文字'
                            ..type = 'text'
                            ..widget = _buildTextContent();
                          _contentList.add(clip);
                          break;
                        default:
                      }
                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          item.icon,
                          size: 20,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          child: Text(
                            item.title,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Container _buildTextContent() {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      color: Colors.white,
      child: Row(children: [
        Container(
            height: 80,
            width: 80,
            // color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey[200],
                    child: Icon(Icons.image,color: Colors.white,size: 30,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey[400],
                    child: Text(
                      '添加图片',
                      style: TextStyle(color: Colors.white,fontSize: 12),
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 8,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ]),
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
        Container(
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
      ],
    );
  }
}
