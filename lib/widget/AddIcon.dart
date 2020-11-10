/*
 * @Author: zhc
 * @Date: 2020-11-11 00:05:31
 * @LastEditTime: 2020-11-11 00:59:02
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_article_editor/model/Model.dart';
import 'package:flutter_article_editor/stream/ComponentStream.dart';

import 'EditComponent.dart';

class AddIcon extends StatelessWidget {


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
  Widget build(BuildContext context) {
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
                      ComponentStream.addTextItem();
                      // print('插入￥${item.title}');
                      // switch (item.title) {
                      //   case '文字':
                      //     ClipModel clip = ClipModel()
                      //       ..title = '文字'
                      //       ..type = 'text'
                      //       ..widget = EditComponent.editTextComponent();
                      //     _contentList.add(clip);
                      //     break;
                      //   default:
                      // }
                      // // setState(() {});
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
}