import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget button(
    String title,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 35,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 00,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: Colors.grey[800],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(""),
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: IconButton(
                icon: Icon(Icons.backspace_outlined), onPressed: () {}),
          ),
          Divider(
            color: Colors.white,
            indent: 15,
            endIndent: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("C", Colors.red),
              button("( )", Colors.green),
              button("%", Colors.green),
              button("÷", Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("7", Colors.white),
              button("8", Colors.white),
              button("9", Colors.white),
              button("×", Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("4", Colors.white),
              button("5", Colors.white),
              button("6", Colors.white),
              button("−", Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("1", Colors.white),
              button("2", Colors.white),
              button("3", Colors.white),
              button("+", Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("+/-", Colors.white),
              button("0", Colors.white),
              button(".", Colors.white),
              button("=", Colors.green),
            ],
          )
        ],
      ),
    );
  }
}
