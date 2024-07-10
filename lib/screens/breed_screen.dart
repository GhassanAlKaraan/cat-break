import 'package:cat_break/screens/cat_info_screen.dart';
import 'package:flutter/material.dart';

class BreedScreen extends StatelessWidget {
  const BreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "< Breed 1",
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
              Expanded(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(6, (index) {
                    return CustomGridItem(breedName: 'Cat ${index + 1}');
                  }),
                ),
              ),
              Divider(
                color: Colors.pink.shade800,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  "Fetch More Cats!",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
              )
            ],
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
      child: GestureDetector(
        onTap: (){
          // Push to CatInfoScreen
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CatInfoScreen()));
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
