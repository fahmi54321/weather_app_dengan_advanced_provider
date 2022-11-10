import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dengan_advanced_provider/providers/temp/temp_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celcius/Fahrenheit (Default: Celcius)'),
          trailing: Switch(
            value: context.watch<TempProvider>().state.tempUnit ==
                TempUnit.celcius, //todo 1
            onChanged: (_) {
              //todo 2 (finish)
              context.read<TempProvider>().toggleTempUnit();
            },
          ),
        ),
      ),
    );
  }
}
