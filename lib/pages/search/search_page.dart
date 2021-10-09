import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ty_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:ty_flutter_cli/components/loading_indicator.dart';
import 'package:ty_flutter_cli/pages/search/components/search_item_card.dart';
import 'package:ty_flutter_cli/pages/search/components/search_tag.dart';
import 'package:ty_flutter_cli/pages/search/search_controller.dart';
import 'package:ty_flutter_cli/res/R.dart';

import 'components/search_bar.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 375),
          color: controller.hasError.value ? R.color.error : R.color.primary,
          child: Scaffold(
              floatingActionButton: Obx(() => FloatingActionButton(
                    onPressed: () {
                      controller.noThrottling.value =
                          !controller.noThrottling.value;
                    },
                    child: controller.noThrottling.value
                        ? Icon(Icons.error)
                        : Icon(Icons.check),
                  )),
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  GetBuilder<SearchController>(builder: (_) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 375),
                      color: _.hasError.value
                          ? R.color.error
                          : R.color.transparent,
                      padding: EdgeInsets.only(top: kToolbarHeight),
                      height: 210,
                      child: Column(
                        children: [
                          SearchBar(
                            controller: _.textEditingController,
                            onChanged: _.onChanged,
                            onClear: _.onClear,
                          ),
                          Expanded(
                              child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: _.historyList.length,
                              itemBuilder: (BuildContext context, int i) {
                                return AnimationConfiguration.staggeredList(
                                  position: i,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    horizontalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: SearchTag(
                                        tag: _.historyList[i],
                                        onTap: _.onTagTap,
                                        selected: _.keyword == _.historyList[i],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 25),
                            ),
                          ))
                        ],
                      ),
                    );
                  }),
                  Expanded(
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: FutureLoadStateBuilder<SearchController>(
                          errorBuilder: (String? s) => _SearchErrorWidget(),
                          emptyBuilder: (BuildContext context) =>
                              _SearchEmptyWidget(),
                          loadingBuilder: (_) => Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 144),
                                    child: DCCircularProgressIndicator(
                                      strokeWidth: 15,
                                      backgroundColor: Color(0xFFEDF2F7),
                                    ),
                                  ),
                                ],
                              ),
                          builder: (_) {
                            return Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: AnimationLimiter(
                                          child: ListView.separated(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25),
                                              shrinkWrap: true,
                                              itemCount: _.list.length,
                                              separatorBuilder:
                                                  (BuildContext context, int i) =>
                                                      Divider(
                                                        thickness: 1,
                                                      ),
                                              itemBuilder: (BuildContext context,
                                                      int i) =>
                                                  AnimationConfiguration
                                                      .staggeredList(
                                                          position: i,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      375),
                                                          child: SlideAnimation(
                                                              // verticalOffset: 50.0,
                                                              horizontalOffset:
                                                                  20.0,
                                                              child: FadeInAnimation(
                                                                  child: SearchItemCard(
                                                                      onTap: _
                                                                          .onItemTap,
                                                                      item: _.list[
                                                                          i]))))),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            top: 36, bottom: 12),
                                        child: Text(
                                          "${_.list.length} Items",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16, height: 20 / 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              )),
        ));
  }
}

class _SearchErrorWidget extends StatelessWidget {
  const _SearchErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 82, bottom: 28),
                child: Image.asset(R.icon.empty)),
            Text(
              "Aaaah!\n Something went wrong",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24, height: 26 / 24, color: R.color.title),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text.rich(
                TextSpan(
                    text: "Brace yourself till we get the error fixed.\n",
                    style: TextStyle(
                        fontSize: 14,
                        height: 26 / 14,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text:
                            "You may also refresh the page\n or try again later.",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchEmptyWidget extends StatelessWidget {
  const _SearchEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 82, bottom: 28),
                child: Image.asset(R.icon.empty)),
            Text(
              "Nothing Found",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24, height: 26 / 24, color: R.color.title),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text.rich(
                TextSpan(
                    text: "We couldn't find what you were looking for.\n",
                    style: TextStyle(
                        fontSize: 14,
                        height: 26 / 14,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text:
                            "Keep calm and search again. We use so\n many other cool stuff, surely we use\n something you like.",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
