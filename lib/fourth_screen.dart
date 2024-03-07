import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const Text(
                    'I Am Looking For...',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                      'Provide us with further insights your preferences'),
                  const SizedBox(
                    height: 40,
                  ),
                  const Column(
                    children: [
                      SmallItemContainer(
                          icon: Icons.circle_outlined, text: 'A Relationship'),
                      SizedBox(
                        height: 20,
                      ),
                      SmallItemContainer(
                          icon: Icons.circle_outlined,
                          text: 'Something casual'),
                      SizedBox(
                        height: 20,
                      ),
                      SmallItemContainer(
                          icon: Icons.circle_outlined,
                          text: 'I\'m not sure yet'),
                      SizedBox(
                        height: 20,
                      ),
                      SmallItemContainer(
                          icon: Icons.circle_outlined,
                          text: 'Prefer not to say'),
                    ],
                  ),
                  const SizedBox(height: 200),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallItemContainer extends StatefulWidget {
  final IconData icon;
  final String text;

  const SmallItemContainer({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  State<SmallItemContainer> createState() => _SmallItemContainerState();
}

class _SmallItemContainerState extends State<SmallItemContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.red : Colors.white),
            borderRadius: BorderRadius.circular(25),
            color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                // color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const Spacer(),
            Icon(widget.icon, color: isSelected ? Colors.red : Colors.grey),
          ],
        ),
      ),
    );
  }
}
