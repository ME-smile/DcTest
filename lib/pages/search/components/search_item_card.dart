/*
 * @Description: 搜索卡片
 * @Author: iamsmiling
 * @Date: 2021-10-08 21:26:25
 * @LastEditTime: 2021-10-09 11:36:09
 */
import 'package:flutter/material.dart';
import 'package:ty_flutter_cli/model/search/search_item_model.dart';
import 'package:ty_flutter_cli/res/R.dart';

class SearchItemCard extends StatelessWidget {
  final SearchItemModel item;
  final Function(SearchItemModel) onTap;
  const SearchItemCard({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(item),
      child: Container(
        padding: EdgeInsets.only(top: 32, bottom: 20),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 1.5, color: const Color(0xFFEDF2F7))),
              child: Image.network(
                item.image,
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        color: R.color.title,
                        fontSize: 16,
                        height: 26 / 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 16 / 12,
                        letterSpacing: 0.75,
                      ),
                    ),
                  )
                ],
              ),
            )),
            Image.asset(R.icon.jump)
          ],
        ),
      ),
    );
  }
}
