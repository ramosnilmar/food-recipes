import 'package:ecommerce_app/components/main_app_bar.dart';
import 'package:ecommerce_app/components/main_drawer.dart';
import 'package:ecommerce_app/models/settings.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
    required this.onSettingsChanged,
    required this.settings,
  });

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: const MainAppBar(title: 'Configurações'),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  title: 'Sem Glúten',
                  subtitle: 'Só exibe refeições sem glúten',
                  value: settings.isGlutenFree,
                  onChanged: (value) =>
                      setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe refeições sem lactose',
                  value: settings.isLactoseFree,
                  onChanged: (value) =>
                      setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições sem vegana',
                  value: settings.isVegan,
                  onChanged: (value) =>
                      setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe refeições vegetarianas',
                  value: settings.isVegetarian,
                  onChanged: (value) =>
                      setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
