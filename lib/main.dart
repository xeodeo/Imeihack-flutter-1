import 'package:flutter/material.dart';
import 'pages/dialer_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DialerApp());
}

class DialerApp extends StatelessWidget {
  const DialerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador Telefónico',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.samsungTheme,
      home: const DialerPage(),
    );
  }
}
