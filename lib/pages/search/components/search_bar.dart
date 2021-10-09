/*
 * @Description: 搜索框
 * @Author: iamsmiling
 * @Date: 2021-10-08 23:22:14
 * @LastEditTime: 2021-10-09 11:14:36
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ty_flutter_cli/res/R.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onClear;
  SearchBar({Key? key, this.controller, this.onChanged, this.onClear})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  void _clear() {
    widget.controller?.clear();
    if (widget.onClear != null) {
      widget.onClear!();
    }
  }

  void _onChanged(String s) {
    if (widget.onChanged != null) {
      widget.onChanged!(s);
    }
  }

  _listen() {
    _canClear = widget.controller?.text.isNotEmpty ?? false;
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_listen);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_listen);
    super.dispose();
  }

  bool _canClear = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin:
                  EdgeInsets.only(left: 24, right: 12, top: 16.5, bottom: 16.5),
              child: Image.asset(R.icon.search)),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: _onChanged,
              decoration: InputDecoration(hintText: "Search"),
            ),
          ),
          Visibility(
            visible: _canClear,
            child: GestureDetector(
              onTap: _clear,
              child: Container(
                margin: EdgeInsets.all(22.5),
                child: Image.asset(R.icon.inputClear),
              ),
            ),
          )
        ],
      ),
    );
  }
}
