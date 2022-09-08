import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final int id;
  final String name;
  final String thumbnail;
  final String? description;

  const CharacterCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.thumbnail,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 7), child: Card());
  }
}
