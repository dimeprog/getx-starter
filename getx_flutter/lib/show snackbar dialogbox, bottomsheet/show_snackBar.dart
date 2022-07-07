import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20Route/named_route.dart';

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Show Getx SnackBar',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                child: Text('show snackbar'),
                onPressed: () {
                  Get.showSnackbar(
                    const GetSnackBar(
                      snackStyle: SnackStyle.FLOATING,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black12,
                      duration: Duration(
                        seconds: 2,
                      ),
                      titleText: Text(
                        'snack bar show',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      messageText: Text(
                        'you just press show snackbar button',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('show DialogBox'),
                onPressed: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.blueGrey,
                    title: 'show Dialog box',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    middleText: 'This is the  dialog box shown',
                    middleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    onCancel: () {},
                    onConfirm: () {},
                    textCancel: 'NO',
                    textConfirm: 'Yes',
                    buttonColor: Colors.pink,
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('show BottomSheet'),
                onPressed: () {
                  Get.bottomSheet(
                    BottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      onClosing: () {},
                      builder: (context) => Container(
                        height: 500,
                        width: 200,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: 20,
                                itemBuilder: (context, i) => ListTile(
                                  onTap: () {},
                                  hoverColor: Colors.blue,
                                  selectedTileColor: Colors.pink,
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 20,
                                  ),
                                  title: Text('God is Good'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('show BottomSheet'),
                onPressed: () {
                  Get.bottomSheet(Container(
                    height: 100,
                    width: double.infinity,
                    child: Wrap(children: <Widget>[
                      ListTile(
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                        leading: Icon(Icons.wb_incandescent),
                        title: Text('Light Theme'),
                      ),
                      ListTile(
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                        leading: Icon(Icons.wb_incandescent_outlined),
                        title: Text('Dark Theme'),
                      ),
                    ]),
                  ));
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(NamedRoute());
                },
                child: const Text('Go to DashboardPage')),
          ],
        ),
      ),
    );
  }
}
