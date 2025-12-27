import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/screens/root_screen.dart';
import 'package:whatsapp_automation/states/application_state.dart';

void main() => runApp(
  // Here we've now access to the Application State in the "states=>application_state.dart" file and that states can be shared to all the screens
  ChangeNotifierProvider(
    create: (_) => ApplicationState(),
    child: const WhatsAppAutomation(),
  ),
);

class WhatsAppAutomation extends StatelessWidget {
  const WhatsAppAutomation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Return the RootScreen, and that screen manages onboarding of the App
        body: RootScreen(),
      ),
    );
  }
}
