import 'package:flutter/material.dart';
import 'package:class_assignment_2/app.dart';
import 'package:class_assignment_2/servicelocator/service_locator.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    App(),
  );
}
