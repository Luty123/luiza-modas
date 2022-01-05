import 'dart:math';
import 'package:flutter/material.dart';

// Classe responsavel pelo icone e animação de load no aplicativo
class Loader extends StatefulWidget {
  final Color centralDotColor;
  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Color dotFourColor;
  final Color dotFiveColor;
  final Color dotSixColor;
  final Color dotSevenColor;
  final Color dotEightColor;
  final double centralDotRadius;
  final double outerDotRadius;
  final double spanRadius;
  final Duration duration;

  Loader(
      {this.centralDotColor = Colors.amber,
      this.dotOneColor = Colors.red,
      this.dotTwoColor = Colors.lightBlue,
      this.dotThreeColor = Colors.orange,
      this.dotFourColor = Colors.green,
      this.dotFiveColor = Colors.yellow,
      this.dotSixColor = Colors.blue,
      this.dotSevenColor = Colors.pink,
      this.dotEightColor = Colors.lightGreen,
      this.centralDotRadius = 15.0,
      this.spanRadius = 15.0,
      this.duration = const Duration(seconds: 10),
      this.outerDotRadius = 5.0});

  _LoaderState createState() => _LoaderState(centralDotRadius);
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController page1Controller;
  Animation<double> animationRotation;
  Animation<double> animationRadiusIn;
  Animation<double> animationRadiusOut;

  final double initialRadius;
  double radius = 0.0;

  _LoaderState(this.initialRadius);

  @override
  void initState() {
    page1Controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    super.initState();

    animationRadiusIn =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: page1Controller,
      curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
    ));
    animationRadiusOut =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: page1Controller,
      curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
    ));
    animationRotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: page1Controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    page1Controller.addListener(() {
      if (page1Controller.value >= 0.75 && page1Controller.value <= 1.0) {
        setState(() {
          radius = animationRadiusIn.value * initialRadius;
        });
      } else if (page1Controller.value >= 0.0 &&
          page1Controller.value <= 0.25) {
        setState(() {
          radius = animationRadiusOut.value * initialRadius;
        });
      }
    });

    page1Controller.repeat();
  }

  @override
  void dispose() {
    page1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: widget.centralDotRadius,
                color: widget.centralDotColor,
              ),
              Transform.translate(
                  offset: Offset(cos(pi / 4) * radius, sin(pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotOneColor,
                  )),
              Transform.translate(
                  offset: Offset(
                      cos(2 * pi / 4) * radius, sin(2 * pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotTwoColor,
                  )),
              Transform.translate(
                  offset: Offset(
                      cos(3 * pi / 4) * radius, sin(3 * pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotThreeColor,
                  )),
              Transform.translate(
                  offset: Offset(cos(pi) * radius, sin(pi) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotFourColor,
                  )),
              Transform.translate(
                  offset: Offset(
                      cos(5 * pi / 4) * radius, sin(5 * pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotFiveColor,
                  )),
              Transform.translate(
                  offset: Offset(
                      cos(6 * pi / 4) * radius, sin(6 * pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotSixColor,
                  )),
              Transform.translate(
                  offset: Offset(
                      cos(7 * pi / 4) * radius, sin(7 * pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotSevenColor,
                  )),
              Transform.translate(
                  offset: Offset(
                      cos(8 * pi / 4) * radius, sin(8 * pi / 4) * radius),
                  child: Dot(
                    radius: widget.outerDotRadius,
                    color: widget.dotEightColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
