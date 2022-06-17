import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "X",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];
  var userQuestion = "";
  var userAnswe = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswe,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            )),
        Expanded(
            flex: 3,
            child: SizedBox(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: buttons.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = "";
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white);
                    } else if (index == 1) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white);
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white);
                    } else {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blue
                              : Colors.deepPurple,
                          textColor: Colors.white);
                    }
                  }),
            ))
      ]),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '+' || x == '-' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("X", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswe = eval.toString();
  }
}
