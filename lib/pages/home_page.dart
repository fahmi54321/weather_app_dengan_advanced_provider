import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dengan_advanced_provider/pages/search_page.dart';
import 'package:weather_app_dengan_advanced_provider/providers/weather/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? city;

  //todo 5
  late final WeatherProvider weatherProvider;

  //todo 6
  @override
  void dispose() {
    weatherProvider.removeListener(_registerListener);
    super.dispose();
  }

  //todo 7
  @override
  void initState() {
    super.initState();
    weatherProvider = context.read<WeatherProvider>();
    weatherProvider.addListener(_registerListener);
  }

  //todo 8
  void _registerListener() {
    final WeatherState state = context.read<WeatherProvider>().state;

    if (state.status == WeatherStatus.error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(state.customError.errMsg),
          );
        },
      );
    }
  }

  //todo 9 (finish)
  Widget _showWeather() {
    final state = context.watch<WeatherProvider>().state;

    if (state.status == WeatherStatus.initial) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      );
    }

    if (state.status == WeatherStatus.error && state.weather.name.isEmpty) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      );
    }

    if (state.status == WeatherStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        Text(
          state.weather.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TimeOfDay.fromDateTime(state.weather.lastUpdated).format(context),
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(width: 10.0),
            Text(
              '(${state.weather.country})',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              //todo 1 (next search_page.dart)
              city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );

              // todo 3
              if (city != null) {
                context.read<WeatherProvider>().fetchWather(city ?? '');
              }
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: _showWeather(), //todo 4
    );
  }
}
