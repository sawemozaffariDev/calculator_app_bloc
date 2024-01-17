import 'dart:async';

import 'package:calculator_app_bloc/bloc/caculator_state.dart';
import 'package:calculator_app_bloc/bloc/calculator_event.dart';
import 'package:calculator_app_bloc/bloc/calculator_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {

  final CalculatorRepo calculatorRepo = CalculatorRepo();

  CalculatorBloc() : super(CalculatorInitialState()) {
    on<InitialEvent>(init);
    on<AddEvent>(addNumbers);
    on<SubtractEvent>(subtractNumbers);
    on<MultiplyEvent>(multiplyNumbers);
    on<DivideEvent>(divideNumbers);
  }

  FutureOr<void> addNumbers(AddEvent event, Emitter<CalculatorState> emit) {
    var x = event.num1 + event.num2;
    emit(CalculatorResultState(result: x));
  }

  FutureOr<void> subtractNumbers(
      SubtractEvent event, Emitter<CalculatorState> emit) {
    var x = event.num1 - event.num2;
    emit(CalculatorResultState(result: x));
  }

  FutureOr<void> multiplyNumbers(
      MultiplyEvent event, Emitter<CalculatorState> emit) {
    var x = event.num1 * event.num2;
    emit(CalculatorResultState(result: x));
  }

  FutureOr<void> divideNumbers(
      DivideEvent event, Emitter<CalculatorState> emit) {
    var x = event.num1 / event.num2;
    emit(CalculatorResultState(result: x));
  }

  FutureOr<void> init(InitialEvent event, Emitter<CalculatorState> emit) {
    var logger = Logger();
    logger.e("<<<  initial  >>>");
  }
}
