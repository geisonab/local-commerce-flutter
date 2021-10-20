import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:local_commerce/app/views/splashscreen/splashscreen_page.dart';

main() {
  testWidgets('SplashscreenPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(SplashscreenPage(title: 'Splashscreen')));
    final titleFinder = find.text('Splashscreen');
    expect(titleFinder, findsOneWidget);
  });
}
