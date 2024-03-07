import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  final VoidCallback onNextPage;

  const ThirdScreen({Key? key, required this.onNextPage}) : super(key: key);

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
                  'What\'s Your Gender?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text('Tell us about your gender'),
                const SizedBox(
                  height: 40,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemContainer(icon: Icons.male, text: 'Male'),
                    SizedBox(
                      height: 30,
                    ),
                    ItemContainer(icon: Icons.female, text: 'Female'),
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
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
            )
          ],
        ),
      ),
    );
  }
}

class ItemContainer extends StatefulWidget {
  final IconData icon;
  final String text;

  const ItemContainer({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: CircleAvatar(
        backgroundColor: isSelected ? Colors.red : Colors.white,
        radius: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 50,
            ),
            const SizedBox(height: 20),
            Text(
              widget.text,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
