import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/characters.dart';
import '../services/characters.api.dart';
import '../widgets/character_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character> characters = [];

  bool isloading = true;

  @override
  void initState() {
    getCharacters();
    super.initState();
  }

  Future<void> getCharacters() async {
    characters = await CharacterApi.getCharacters();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Marvel'),
          centerTitle: true,
        ),
        body: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: characters.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (((context, index) {
                  return Card(
                      child: CachedNetworkImage(
                          imageUrl: characters[index].thumbnail));
                })),
              ));
  }
}
