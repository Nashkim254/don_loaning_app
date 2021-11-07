import 'package:don/src/constants/colors.dart';
import 'package:don/src/navigation/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);
  static const routeName = '/navigation';
  @override
  State<StatefulWidget> createState() {
    return _NavigationView();
  }
}

class _NavigationView extends State<NavigationView> {
  final navigationController = Get.put(NavigationController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.brightness == Brightness.light
            ? backgroundLight
            : backgroundDark,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        showUnselectedLabels: false,
        selectedItemColor:
            theme.brightness == Brightness.light ? accentLight : backgroundDark,
        unselectedItemColor:
            theme.brightness == Brightness.light ? primaryLight : primaryDark,
        currentIndex: navigationController.isSelected,
        elevation: 6.0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/homenav.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/homenav.svg"),
            label: "Loans",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/homenav.svg"),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          navigationController.updateSelected(index);
          setState(() {
            navigationController.isSelected = index;
          });
        },
      ),
      body: navigationController.tab(),
    );
  }
}
