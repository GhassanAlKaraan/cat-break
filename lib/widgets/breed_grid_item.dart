import 'package:cat_break/models/catbreed_model.dart';
import 'package:cat_break/screens/cat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BreedGridItem extends StatelessWidget {
  final CatBreed breed;

  const BreedGridItem(
      {super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          // Go to Breed Screen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CatListScreen(
                    breed:breed
                  )));
        },
        child: Column(children: [
          Container(
            clipBehavior: Clip.none,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade800, width: 5),
            ),
            child: FutureBuilder<Widget>(
              future: _loadImage(breed.referenceImageId ?? ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(child: Icon(Icons.error));
                  }
                  return snapshot.data!;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.pink.shade900)),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 5),
          Container(
            color: Colors.pink.shade800,
            height: 35,
            child: Center(
              child: Text(
                breed.name!,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future<Widget> _loadImage(String imageId) async {
    final imageUrls = [
      "https://cdn2.thecatapi.com/images/$imageId.jpg",
      "https://cdn2.thecatapi.com/images/$imageId.png",
    ];

    for (final url in imageUrls) {
      final response = await http.head(Uri.parse(url));
      if (response.statusCode == 200) {
        return Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.pink.shade900)),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.error));
          },
        );
      }
    }

    throw Exception("Failed to load image");
  }
}
