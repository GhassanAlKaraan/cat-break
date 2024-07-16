import 'package:cat_break/providers/cat_provider.dart';
import 'package:cat_break/widgets/breed_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                        left: 50,
                        top: -20,
                        child: Image.asset(
                          'assets/icons/pawprint.png',
                          color: Colors.white,
                          width: 80,
                        ),
                      ),
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
                    ]),
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
                const CatBreedsGridView()
              ],
            ),
          ),
        ));
  }
}

class CatBreedsGridView extends StatelessWidget {
  const CatBreedsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CatProvider>(
        builder: (context, catProvider, child) {
          final catBreeds = catProvider.catBreeds;

          if (catBreeds.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade900),
              ),
            );
          }

          return GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(catBreeds.length, (index) {
              final breed = catBreeds[index];
              return BreedGridItem(
                breed:breed
              );
            }),
          );
        },
      ),
    );
  }
}