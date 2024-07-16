import 'package:cat_break/models/catbreed_model.dart';
import 'package:cat_break/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cat_break/screens/cat_info_screen.dart';

class CatListScreen extends StatefulWidget {
  final CatBreed breed;

  const CatListScreen({super.key, required this.breed});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CatProvider>(context, listen: false)
          .fetchCatsByBreed(widget.breed.id!);
    });
  }

  _refreshCats() async {
    await Provider.of<CatProvider>(context, listen: false)
        .fetchCatsByBreed(widget.breed.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<CatProvider>(context, listen: false)
                          .clearCatsList();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "< ${widget.breed.name}",
                      style: const TextStyle(fontSize: 35),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    color: Colors.pink.shade800,
                    child: Text(
                      widget.breed.id!,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
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
                child: Consumer<CatProvider>(
                  builder: (context, catProvider, child) {
                    final cats = catProvider.catsByBreed;

                    if (cats.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.pink.shade900),
                        ),
                      );
                    }

                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: cats.length,
                      itemBuilder: (context, index) {
                        final cat = cats[index];
                        return CustomGridItem(
                          breed: widget.breed,
                          imageUrl: cat.url!,
                        );
                      },
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Divider(
                    color: Colors.pink.shade800,
                  ),
                  GestureDetector(
                    onTap: () => _refreshCats(),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Text(
                        "refresh cats",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridItem extends StatelessWidget {
  final CatBreed breed;
  final String imageUrl;

  const CustomGridItem({
    super.key,
    required this.imageUrl,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: GestureDetector(
        onTap: () {
          // Push to CatInfoScreen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CatInfoScreen(
                        breed: breed,
                        imageUrl: imageUrl,
                      )));
        },
        child: Container(
          clipBehavior: Clip.none,
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink.shade800, width: 5),
              borderRadius: BorderRadius.circular(8)),
          child: Image.network(
            imageUrl,
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
          ),
        ),
      ),
    );
  }
}
