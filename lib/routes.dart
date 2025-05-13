import 'package:flutter/material.dart';
import 'screen/login.dart';
import 'screen/homepage.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/home': (context) => KoperasiApp(),
};
