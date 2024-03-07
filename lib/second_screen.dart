import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SecondScreen extends StatelessWidget {
  final VoidCallback onNextPage;

  const SecondScreen({Key? key, required this.onNextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 186, 136, 132)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'How Old Are You?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text('Please provide your age in years'),
                const SizedBox(height: 60),
                const VerticalNumberPicker(),
                const SizedBox(height: 50),
                SizedBox(
                  width: 350,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      onNextPage();
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalNumberPicker extends StatefulWidget {
  const VerticalNumberPicker({Key? key}) : super(key: key);

  @override
  State<VerticalNumberPicker> createState() => _VerticalNumberPickerState();
}

class _VerticalNumberPickerState extends State<VerticalNumberPicker> {
  int _selectedNumber = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '${_selectedNumber - 3}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          '${_selectedNumber - 2}',
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 107, 106, 106),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  minValue: 15,
                  maxValue: 120,
                  value: _selectedNumber,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedNumber = newValue;
                    });
                  },
                  itemHeight: 80,
                  axis: Axis.vertical,
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  selectedTextStyle: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          '${_selectedNumber + 2}',
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 107, 106, 106),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          '${_selectedNumber + 3}',
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 134, 133, 133),
          ),
        ),
      ],
    );
  }
}
