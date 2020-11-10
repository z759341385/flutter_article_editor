/*
 * @Author: zhc
 * @Date: 2020-11-11 00:10:00
 * @LastEditTime: 2020-11-11 00:14:27
 * @Description: 
 * @LastEditors: zhc
 */
import 'package:flutter/material.dart';

class EditComponent {
  static editTextComponent() {
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
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey[400],
                    child: Text(
                      '添加图片',
                      style: TextStyle(color: Colors.white, fontSize: 12),
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
}
