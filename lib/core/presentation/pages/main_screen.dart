import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: _mainScreenStructre(displayPage: const Text("hee")),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -4),
            end: Alignment(0, 0),
            colors: [
              Color(0xFF342450),
              Color(0xFF201637),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).size.height / 10,
      ),
    );
  }

  Widget _mainScreenStructre({required Widget displayPage}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill),
      ),
      child: displayPage,
    );
  }
}
