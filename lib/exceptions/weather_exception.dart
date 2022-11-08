class WeatherException implements Exception {
  String messages;
  WeatherException([this.messages = 'Something went wrong']) {
    messages = 'Weather Exception: $messages';
  }

  @override
  String toString() {
    return messages;
  }
}
