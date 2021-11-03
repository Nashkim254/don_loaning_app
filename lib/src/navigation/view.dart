
import 'package:don/src/constants/colors.dart';
import 'package:don/src/navigation/controller.dart';
import 'package:flutter/material.dart';
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
              activeIcon: Icon(
                Icons.home,
                size: 32,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: greyColor,
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.analytics_outlined,
              size: 28,
            ),
            icon: Icon(
              Icons.analytics_outlined,
              color: greyColor,
              size: 26,
            ),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.wysiwyg_outlined,
              size: 28,
            ),
            icon: Icon(
              Icons.wysiwyg_outlined,
              color: greyColor,
              size: 26,
            ),
            label: "My Bills",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person_outline_rounded,
              size: 32,
            ),
            icon: Icon(
              Icons.person_outline_rounded,
              color: greyColor,
              size: 28,
            ),
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
