import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric goToCalendarPage() {
  return when1<String, FlutterWorld>(
      'I go to the {string} page', (key, context) async {
      final navigationDrawerLocator = find.byValueKey('navigation-drawer');
      await FlutterDriverUtils.tap(context.world.driver, navigationDrawerLocator);
      final pageLocator = find.byValueKey(key);
      await FlutterDriverUtils.tap(context.world.driver, pageLocator);
    }
  );
}
