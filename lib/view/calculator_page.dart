import 'package:calculator_app_bloc/bloc/caculator_state.dart';
import 'package:calculator_app_bloc/bloc/calculator_bloc.dart';
import 'package:calculator_app_bloc/bloc/calculator_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CalculatorOperator { ADD, SUBTRACT, MULTIPLY, DIVIDE }

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  CalculatorBloc calculatorBloc = CalculatorBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculatorBloc.add(InitialEvent());
  }

  TextEditingController firstTextController = TextEditingController();
  TextEditingController secondTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator With Bloc"),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: firstTextController,
              decoration: const InputDecoration(labelText: "first number"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: secondTextController,
              decoration: const InputDecoration(labelText: "second number"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 0.8),
                    child: ElevatedButton(
                        onPressed: () =>
                            _onOperatorPressed(CalculatorOperator.ADD),
                        child: Text("+")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 0.8),
                    child: ElevatedButton(
                        onPressed: () =>
                            _onOperatorPressed(CalculatorOperator.SUBTRACT),
                        child: Text("-")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 0.8),
                    child: ElevatedButton(
                        onPressed: () =>
                            _onOperatorPressed(CalculatorOperator.MULTIPLY),
                        child: Text("*")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 0.8),
                    child: ElevatedButton(
                        onPressed: () =>
                            _onOperatorPressed(CalculatorOperator.MULTIPLY),
                        child: Text("/")),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            BlocProvider<CalculatorBloc>(
              create: (BuildContext context) => calculatorBloc,
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                if (state is CalculatorInitialState) {
                  return const Text("ANYYYYYYYYYYYYYYYYYYYYYYYY");
                } else if (state is CalculatorResultState) {
                  return Text("result is ${state.result}");
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  _onOperatorPressed(CalculatorOperator operator) {
    double num1 = double.tryParse(firstTextController.text) ?? 0.0;
    double num2 = double.tryParse(secondTextController.text) ?? 0.0;

    switch (operator) {
      case CalculatorOperator.ADD:
        calculatorBloc.add(AddEvent(num1: num1, num2: num2));
      case CalculatorOperator.SUBTRACT:
        calculatorBloc.add(SubtractEvent(num1: num1, num2: num2));
      case CalculatorOperator.MULTIPLY:
        calculatorBloc.add(MultiplyEvent(num1: num1, num2: num2));
      case CalculatorOperator.DIVIDE:
        calculatorBloc.add(DivideEvent(num1: num1, num2: num2));
    }
  }
}
