import 'package:ecommerce_app/components/main_app_bar.dart';
import 'package:ecommerce_app/components/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: MainDrawer(),
      appBar: MainAppBar(title: 'Configurações'),
    );
  }
}
