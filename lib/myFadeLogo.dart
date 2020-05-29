import 'package:flutter/cupertino.dart';

class MyFadeLogo extends StatefulWidget {
  const MyFadeLogo({Key key}) : super(key: key);

  @override
  _MyFadeLogoState createState() => _MyFadeLogoState();
}

class _MyFadeLogoState extends State<MyFadeLogo> {
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        opacity = opacity == 0.3 ? 0.1 : 0.3;
        changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:       AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 600),
        child: Container(
          height: 150,
          width: 300,
          child: Image(image: AssetImage('assets/images/Logotipo.png')),
        ),
      ),
    );
  }
}
