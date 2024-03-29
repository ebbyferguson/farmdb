import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imagecolor;

  Walkthrough(
      {this.title,
      this.content,
      this.imageIcon,
      this.imagecolor = Colors.redAccent});

  @override
  WalkthroughState createState() {
    return WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Material(
        color: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(widget.content,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black)),
            ),
            Icon(
              widget.imageIcon,
              size: 100.0,
              color: widget.imagecolor,
            )
          ],
        ),
      ),
    );
  }
}
