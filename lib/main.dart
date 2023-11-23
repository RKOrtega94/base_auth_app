import 'package:base_auth_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  // Init dotenv
  dotenv.load(fileName: ".env");
  runApp(const App());
}
