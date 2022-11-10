part of 'theme_provider.dart';

//todo 1
enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  //todo 2
  final AppTheme appTheme;
  ThemeState({
    this.appTheme = AppTheme.light,
  });

  //todo 6 (next theme_provider.dart)
  factory ThemeState.initial() {
    return ThemeState();
  }

  //todo 3
  @override
  List<Object> get props => [appTheme];

  //todo 4
  @override
  bool get stringify => true;

  //todo 5
  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
