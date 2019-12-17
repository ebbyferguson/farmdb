import 'package:farmdb/presentation/logoicon_icons.dart';
import 'package:farmdb/presentation/piccamera_icons.dart';
import 'package:farmdb/presentation/qrscan_icons.dart';
import 'package:farmdb/utils/farmdb.dart';
import 'package:farmdb/utils/styles.dart';
import 'package:farmdb/widgets/walkthroughLogo.dart';
import 'package:flutter/material.dart';
import 'package:farmdb/utils/my_navigator.dart';
import 'package:farmdb/widgets/walkthrough.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.colorPrimary,
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: [Colors.green[300], Styles.colorPrimaryDark])
      //         ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                WalkthroughLogo(
                  title: 'Welcome',
                  content: Farmdb.wc1,
                  imageIcon: Logoicon.leaf,
                  imagecolor: Colors.green[700],
                ),
                Walkthrough(
                  title: Farmdb.step1,
                  content: Farmdb.wc2,
                  imageIcon: Qrscan.qr_code,
                  imagecolor: Colors.green[700],
                ),
                Walkthrough(
                  title: Farmdb.step2,
                  content: Farmdb.wc3,
                  imageIcon: Piccamera.camera,
                  imagecolor: Colors.green[700],
                ),
                WalkthroughLogo(
                  title: 'Done',
                  content: Farmdb.wc4,
                  imageIcon: Icons.done,
                  imagecolor: Colors.green[700],
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : Farmdb.skip,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : MyNavigator.goToHome(context),
                ),
                FlatButton(
                  child: Text(lastPage ? Farmdb.gotIt : Farmdb.next,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToHome(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
