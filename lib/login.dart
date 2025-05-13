import 'package:flutter/material.dart';
import 'dart:math' as math;

class Iphone13mini8Widget extends StatefulWidget {
  @override
  _Iphone13mini8WidgetState createState() => _Iphone13mini8WidgetState();
}

class _Iphone13mini8WidgetState extends State<Iphone13mini8Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0),
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 375,
                height: 812,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 375,
                height: 812,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, 1),
                    end: Alignment(-1, 0),
                    colors: [
                      Color.fromRGBO(255, 220, 22, 1),
                      Color.fromRGBO(255, 228, 75, 1),
                      Color.fromRGBO(255, 255, 255, 1)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 296,
              left: 175,
              child: Container(
                width: 22,
                height: 17,
              ),
            ),
            Positioned(
              top: 416,
              left: 37,
              child: Container(
                width: 298,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Positioned(
              top: 433,
              left: 53,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/User.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 71,
              left: 111,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(234, 234, 234, 1),
                  borderRadius: BorderRadius.all(Radius.elliptical(150, 150)),
                ),
              ),
            ),
            Positioned(
              top: 388,
              left: 42,
              child: Text(
                'Username',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 507,
              left: 37,
              child: Container(
                width: 298,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Positioned(
              top: 590,
              left: 37,
              child: Container(
                width: 298,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Positioned(
              top: 480,
              left: 44,
              child: Text(
                'Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 659,
              left: 131,
              child: Text(
                'Forgot Password ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 562,
              left: 88,
              child: Transform.rotate(
                angle: 90 * (math.pi / 180),
                child: Container(
                  width: 54,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 204, 204, 1),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 471,
              left: 88,
              child: Transform.rotate(
                angle: 90 * (math.pi / 180),
                child: Container(
                  width: 54,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 204, 204, 1),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 249,
              left: 126,
              child: Text(
                'KOPERASI',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(78, 52, 46, 1),
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  height: 0.8,
                ),
              ),
            ),
            Positioned(
              top: 602,
              left: 157,
              child: Text(
                'Login',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(78, 52, 46, 1),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 522,
              left: 53,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Lock.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
