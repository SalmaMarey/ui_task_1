import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final VoidCallback onNextPage;

  const FirstScreen({Key? key, required this.onNextPage}) : super(key: key);

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
        child: Column(
          children: [
            const Text(
              'Select Up To 3 Interest',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text('Tell us what piques you '),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallItemContainer(icon: Icons.menu_book, text: 'Reading'),
                    SmallItemContainer(icon: Icons.camera, text: 'Photography'),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallItemContainer(
                        icon: Icons.sports_esports, text: 'Gaming'),
                    SmallItemContainer(icon: Icons.music_note, text: 'Music'),
                    SmallItemContainer(
                        icon: Icons.travel_explore, text: 'Travel'),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallItemContainer(
                        icon: Icons.sports_basketball, text: 'Sport'),
                    SmallItemContainer(icon: Icons.art_track, text: 'Art'),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallItemContainer(icon: Icons.home, text: 'Charity'),
                    SmallItemContainer(
                        icon: Icons.restaurant_menu, text: 'Cooking'),
                    SmallItemContainer(icon: Icons.pets, text: 'Pets'),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallItemContainer(
                        icon: Icons.local_movies, text: 'Movies'),
                    SmallItemContainer(icon: Icons.checkroom, text: 'Fashion'),
                  ],
                ),
                const SizedBox(height: 200),
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
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: isSelected ? Colors.white : Colors.red),
            const SizedBox(width: 3),
            Text(
              widget.text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
