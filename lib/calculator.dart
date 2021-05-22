import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget buttonGenerator({
    String title,
    Color textColor,
    Color buttonColor,
  }) {
    if (buttonColor == null) {
      buttonColor = Colors.grey[900];
    }
    return ElevatedButton(
      onPressed: () {
        calculation(title);
      },
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 30,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(80, 80),
        elevation: 00,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: buttonColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(30),
                child: Text(
                  '$text',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: IconButton(
                    icon: Icon(Icons.backspace_outlined), onPressed: () {}),
              ),
            ],
          ),
          Divider(
            color: Colors.white,
            indent: 15,
            endIndent: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonGenerator(
                    title: "AC",
                    textColor: Colors.white,
                    buttonColor: Colors.orange[400],
                  ),
                  buttonGenerator(title: "+/-", textColor: Colors.white),
                  buttonGenerator(title: "%", textColor: Colors.green),
                  buttonGenerator(title: "÷", textColor: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonGenerator(title: "7", textColor: Colors.white),
                  buttonGenerator(title: "8", textColor: Colors.white),
                  buttonGenerator(title: "9", textColor: Colors.white),
                  buttonGenerator(title: "x", textColor: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonGenerator(title: "4", textColor: Colors.white),
                  buttonGenerator(title: "5", textColor: Colors.white),
                  buttonGenerator(title: "6", textColor: Colors.white),
                  buttonGenerator(title: "-", textColor: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonGenerator(title: "1", textColor: Colors.white),
                  buttonGenerator(title: "2", textColor: Colors.white),
                  buttonGenerator(title: "3", textColor: Colors.white),
                  buttonGenerator(title: "+", textColor: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  buttonGenerator(title: "0", textColor: Colors.white),
                  SizedBox(
                    width: 15,
                  ),
                  buttonGenerator(title: ".", textColor: Colors.white),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        calculation('=');
                      },
                      child: Text(
                        "=",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 80),
                        elevation: 00,
                        padding: EdgeInsets.all(20),
                        primary: Colors.green,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(title) {
    if (title == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && title == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (title == '+' ||
        title == '-' ||
        title == 'x' ||
        title == '/' ||
        title == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = title;
      result = '';
    } else if (title == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (title == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (title == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + title;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
