import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NekosLife {
  static const baseUrl = "https://nekos.life/api/v2";
  static Future<String> getImageUrl(String tag) async {
    String url = [baseUrl, "img", tag].join('/');
    String responseBody = (await http.get(url)).body;

    Map response;
    try {
      response = json.decode(responseBody);
    } catch(e) {
      throw new Exception("Json decoder threw exception $e, response body was $responseBody for url $url");
    }

    if(!response.containsKey("url")) throw new Exception("Nekos Life api did not give a URL, got $responseBody for url $url");
    return response["url"] as String;
  }
  static Future<Image> getImage(String tag) async {
    String imageUrl = await getImageUrl(tag);
    return Image.network(imageUrl);
  }
}