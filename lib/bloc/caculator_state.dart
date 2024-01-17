abstract class CalculatorState {}

class CalculatorInitialState extends CalculatorState{}

class CalculatorResultState extends CalculatorState{
  final num result ;
  CalculatorResultState({required this.result});
}