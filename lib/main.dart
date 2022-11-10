import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app_dengan_advanced_provider/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_dengan_advanced_provider/providers/temp/temp_provider.dart';
import 'package:weather_app_dengan_advanced_provider/providers/theme/theme_provider.dart';
import 'package:weather_app_dengan_advanced_provider/providers/weather/weather_provider.dart';
import 'package:weather_app_dengan_advanced_provider/repository/weather_repository.dart';
import 'package:weather_app_dengan_advanced_provider/services/weather_api_services.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRepository>(
          create: (context) => WeatherRepository(
            weatherApiServices: WeatherApiServices(
              httpClient: http.Client(),
            ),
          ),
        ),
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(
            weatherRepository: context.read<WeatherRepository>(),
          ),
        ),

        ChangeNotifierProvider(
          create: (context) => TempProvider(),
        ),

        //todo 1 (finish)
        ChangeNotifierProxyProvider<WeatherProvider, ThemeProvider>(
          create: (context) => ThemeProvider(),
          update: (
            BuildContext context,
            WeatherProvider weatherProvider,
            ThemeProvider? themeProvider,
          ) =>
              themeProvider!..update(weatherProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
