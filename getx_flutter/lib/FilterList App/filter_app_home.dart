import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/FilterList%20App/fliter_list_controller.dart';

import 'list_option.dart';

class FilterListApp extends StatelessWidget {
  FilterListController controller = Get.put(FilterListController());
  // bool onItemSearch(List<String> list, String text) {
  //   if (list
  //       .any((element) => element.toLowerCase().contains(text.toLowerCase()))) {
  //     return list
  //         .where(
  //             (element) => element.toLowerCase().contains(text.toLowerCase()))
  //         .toList();
  //   } else {
  //     return [];
  //   }

  // }

  void openFilterDialog(context) async {
    //
    await FilterListDialog.display<String>(
      context,
      listData: defaultList,
      selectedListData: controller.selectList(),
      backgroundColor: Colors.orange,
      headlineText: 'Your Skills',
      selectedItemsText: 'search here',
      borderRadius: 25,
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (list, text) {
        if (list.contains(text.toLowerCase())) {
          return list.contains(text.toLowerCase());
        } else {
          return false;
        }
      },
      onApplyButtonClick: (list) {
        controller.selectList.value = (List<String>.from(list!));
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Obx(
                () => controller.selectList().isEmpty
                    ? const Text(
                        'Nothing yet',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Wrap(
                        children: controller
                            .selectList()
                            .map((el) => Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Chip(
                                    label: Text(el),
                                  ),
                                ))
                            .toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openFilterDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
