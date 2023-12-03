import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/ad.dart';

class DataSeeder{
  static Map _data={};

  static List<AdData> Ads=[];

  static Future<void> loadData() async {

    //await Future.delayed(const Duration(seconds: 5));
    var response = await rootBundle.loadString('assets/data/data.json');
    _data = jsonDecode(response);
    Ads= (_data["Ads"] as List).map((e) => AdData.fromJson(e)).toList();

  }




}