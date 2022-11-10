// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'temp_provider.dart';

enum TempUnit {
  celcius,
  fahrenheit,
}

class TempState extends Equatable {
  final TempUnit tempUnit;
  TempState({
    this.tempUnit = TempUnit.celcius,
  });

  factory TempState.initial() {
    return TempState();
  }

  @override
  List<Object> get props => [tempUnit];

  @override
  bool get stringify => true;

  TempState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}
