import 'package:don/src/sample_feature/sample_item_details_view.dart';
import 'package:don/src/sample_feature/sample_item_list_view.dart';
import 'package:don/src/settings/settings_controller.dart';
import 'package:don/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class MyRouter {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
      SettingsController? settingsController;
    return MaterialPageRoute<void>(
        settings: settings, builder: (BuildContext context) {
            switch (settings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController!);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
        });
  }
}
