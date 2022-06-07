import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric goToCalendarPage(){
  return given1<String, FlutterWorld>(
      'I go to the {string} screen', (key, context) async {
      final navigationDrawerLocator = find.byValueKey('Navigation-Drawer');
      final pageLocator = find.byValueKey(key);
      await FlutterDriverUtils.tap(context.world.driver, navigationDrawerLocator);
      await FlutterDriverUtils.tap(context.world.driver, pageLocator);
    }
  );
}