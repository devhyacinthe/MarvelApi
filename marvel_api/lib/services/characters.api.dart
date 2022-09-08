import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api/models/characters.dart';

class CharacterApi {
  static Future<List<Character>> getCharacters() async {
    var uri = Uri.parse('https://mcuapi.herokuapp.com/api/v1/movies');
    final response = await http.get(uri);

    Map data = jsonDecode(response.body);

    List temp = [];

    for (var i in data['data']) {
      temp.add(i);
    }

    return Character.characterFromSnapshot(temp);
  }
}
