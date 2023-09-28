import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {@required this.result,
      @required this.interpretation,
      @required this.textresult});

  final String? result;
  final String? interpretation;
  final String? textresult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 85.0,
            width: double.infinity,
            child: Center(
              child: Text(
                'Your Results',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.all(5.0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    textresult!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    result!,
                    style: const TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      interpretation!,
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(8.0)),
              margin: const EdgeInsets.only(top: 5.0),
              width: double.infinity,
              height: 100.0,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
