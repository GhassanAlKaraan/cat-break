import 'package:cat_break/models/catbreed_model.dart';
import 'package:flutter/material.dart';

class CatInfoScreen extends StatelessWidget {
  const CatInfoScreen({super.key, required this.breed, required this.imageUrl});

  final CatBreed breed;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "<<< back to cats",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          'assets/icons/cat.png',
                          color: Colors.black,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink.shade800, width: 5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.pink.shade900)),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${breed.name} Cat",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${breed.temperament}",
                        style:
                            TextStyle(color: Colors.pink.shade700, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${breed.description}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                                text: "Intelligence: ",
                                style: TextStyle(fontSize: 25)),
                            TextSpan(
                              text: "${breed.intelligence}/5",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pink.shade700), // Set color here
                            ),
                            const TextSpan(
                                text: "\nEnergy level: ",
                                style: TextStyle(fontSize: 25)),
                            TextSpan(
                              text: "${breed.energyLevel }/5",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pink.shade700), // Set color here
                            ),
                            const TextSpan(
                                text: "\nOrigin: ",
                                style: TextStyle(fontSize: 25)),
                            TextSpan(
                              text: "${breed.origin}",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue.shade400), // Set color here
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
    );
  }
}
