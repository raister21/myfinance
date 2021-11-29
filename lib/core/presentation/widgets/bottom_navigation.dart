import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int) changeNavIndex;
  final int selectedIndex;
  const BottomNavigation(
      {Key? key, required this.changeNavIndex, required this.selectedIndex})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 20, 0,
          MediaQuery.of(context).size.width / 20, 0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              widget.changeNavIndex(0);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 12,
                  decoration: widget.selectedIndex == 0
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              RadialGradient(tileMode: TileMode.decal, colors: [
                            Color(0x64FFFFFF),
                            Color(0x00201637),
                          ]),
                        )
                      : const BoxDecoration(),
                ),
                SvgPicture.asset("assets/icons/homeIcon.svg")
              ],
            ),
          ),
          InkWell(
            onTap: () {
              widget.changeNavIndex(1);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 12,
                  decoration: widget.selectedIndex == 1
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              RadialGradient(tileMode: TileMode.decal, colors: [
                            Color(0x64FFFFFF),
                            Color(0x00201637),
                          ]),
                        )
                      : const BoxDecoration(),
                ),
                SvgPicture.asset("assets/icons/hamburgerIcon.svg"),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              widget.changeNavIndex(2);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 12,
                  decoration: widget.selectedIndex == 2
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              RadialGradient(tileMode: TileMode.decal, colors: [
                            Color(0x64FFFFFF),
                            Color(0x00201637),
                          ]),
                        )
                      : const BoxDecoration(),
                ),
                SvgPicture.asset("assets/icons/historyIcon.svg"),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              widget.changeNavIndex(3);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 12,
                  decoration: widget.selectedIndex == 3
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              RadialGradient(tileMode: TileMode.decal, colors: [
                            Color(0x64FFFFFF),
                            Color(0x00201637),
                          ]),
                        )
                      : const BoxDecoration(),
                ),
                SvgPicture.asset("assets/icons/settingIcon.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
