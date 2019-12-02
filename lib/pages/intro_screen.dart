import 'package:farmdb/utils/farmdb.dart';
import 'package:farmdb/utils/farmdb.dart';
import 'package:flutter/material.dart';
import 'package:farmdb/utils/farmdb.dart';
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
      color: Colors.green,
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
                Walkthrough(
                  title: Farmdb.wt1,
                  content: Farmdb.wc1,
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: Farmdb.wt2,
                  content: Farmdb.wc2,
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: Farmdb.wt3,
                  content: Farmdb.wc3,
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: Farmdb.wt4,
                  content: Farmdb.wc4,
                  imageIcon: Icons.verified_user,
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
