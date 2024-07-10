import 'package:cat_break/screens/breed_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 150),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Image.asset(
                        'assets/icons/pawprint.png',
                        color: Colors.pink.shade200,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 140,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/icons/pawprint.png',
                      color: Colors.pink.shade200,
                      width: 80,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(
                  height: 140,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 60),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset(
                        'assets/icons/pawprint.png',
                        color: Colors.pink.shade200,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "All Cat Breeds",
                            style: TextStyle(fontSize: 40),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            color: Colors.pink.shade800,
                            child: const Text(
                              "Even the annoying ones",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          'assets/icons/cat.png',
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.pink.shade800,
                  ),
                  Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(6, (index) {
                        return CustomGridItem(breedName: 'Breed ${index + 1}');
                      }),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class CustomGridItem extends StatelessWidget {
  final String breedName;

  const CustomGridItem({super.key, required this.breedName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: GestureDetector(
        onTap: () {
          // Go to Breed Screen
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BreedScreen()));
        },
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade800, width: 5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                color: Colors.pink.shade800,
                height: 35,
                width: double.infinity,
                child: Center(
                  child: Text(
                    breedName,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
