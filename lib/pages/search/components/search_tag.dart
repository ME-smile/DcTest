/*
 * @Description: 搜索词
 * @Author: iamsmiling
 * @Date: 2021-10-08 23:42:46
 * @LastEditTime: 2021-10-09 11:31:55
 */
import 'package:flutter/material.dart';
import 'package:ty_flutter_cli/res/R.dart';

class SearchTag extends StatelessWidget {
  final String tag;
  final Function(String) onTap;
  final bool selected;
  const SearchTag(
      {Key? key, required this.tag, required this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(tag),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 24),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
            color: selected ? R.color.hightlightButton : R.color.button,
            borderRadius: BorderRadius.circular(40)),
        child: Text(
          tag,
          style: TextStyle(
              fontSize: 14,
              color: selected ? R.color.hightlightText : R.color.bodyText,
              height: 18 / 14,
              letterSpacing: .75),
        ),
      ),
    );
  }
}
