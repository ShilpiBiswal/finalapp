import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'audio_screen.dart'; // Updated import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  WidgetStateProperty<Color> getColor(Color color, Color colorOnPressed) {
    final getColor = (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return colorOnPressed;
      }
      return color;
    };
    return WidgetStateProperty.resolveWith(getColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/photos/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xE539597E), Color(0xE539597E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/photos/newlogo.svg',
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'WELCOME',
                  style: TextStyle(
                    fontFamily: 'Alegreya',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Enhance Your Day with\nSpiritual Reflection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0, 100),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AudioPlayerScreen()), // Updated navigation
                      );
                    },
                    child: Text(
                      'Start Chanting',
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: getColor(Colors.transparent, Colors.teal.withOpacity(0.3)),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                      ),
                      backgroundColor: WidgetStateProperty.all(Color(0xFF597EA9)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}