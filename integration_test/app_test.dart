import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:collections/main.dart';


void main() {

  group('linked_list_page test', () {

    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
    as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('TextFormField test', (tester) async {
    await tester.pumpWidget(const MaterialApp(title: 'Collections App'));

    //sleep(const Duration(seconds: 10));

    final loginWidget = find.byKey(const Key('emailTextField'));

    final formFinder = find.byElementType(Form);
    expect(loginWidget, findsOneWidget);
    expect(formFinder, findsOneWidget);
  });
  });
}


