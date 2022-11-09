// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'temp_provider.dart';

//todo 1
enum TempUnit {
  celcius,
  fahrenheit,
}

class TempState extends Equatable {

  //todo 2
  final TempUnit tempUnit;
  TempState({
    this.tempUnit = TempUnit.celcius,
  });

  //todo 6 (next temp_provider.dart)
  factory TempState.initial() {
    return TempState();
  }

  //todo 3
  @override
  List<Object> get props => [tempUnit];

  //todo 4
  @override
  bool get stringify => true;

  //todo 5
  TempState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}
