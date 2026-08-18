import 'package:easy_recap/features/dashboard/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BasePages extends StatefulWidget {
  const BasePages({super.key, required this._navigationShell});

  final StatefulNavigationShell _navigationShell;

  @override
  State<StatefulWidget> createState() => _BasePagesState();
}

class _BasePagesState extends State<BasePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget._navigationShell,
      bottomNavigationBar: NavbarWidget(
        selectedIndex: widget._navigationShell.currentIndex,
        onDestinationSelect: (index) {
          widget._navigationShell.goBranch(
            index,
            initialLocation: index == widget._navigationShell.currentIndex,
          );
        },
        destinations: [
          const DestinationNavbarWidget(label: 'Home', icon: FaIcon(FontAwesomeIcons.solidHouse)),
          const DestinationNavbarWidget(label: 'Class', icon: FaIcon(FontAwesomeIcons.book)),
          const DestinationNavbarWidget(
            label: 'Activity',
            icon: FaIcon(FontAwesomeIcons.clipboardList),
          ),
          const DestinationNavbarWidget(label: 'Settings', icon: FaIcon(FontAwesomeIcons.gear)),
        ],
      ),
    );
  }
}
