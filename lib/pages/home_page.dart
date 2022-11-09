import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dengan_advanced_provider/providers/weather/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // todo 3
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  // todo 5 (fins=ish)
  _fetchWeather() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().fetchWather('london');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
