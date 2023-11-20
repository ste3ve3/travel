import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travellapp/models/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  getPlaces() async {
    var url = "$baseUrl/getplaces";
    http.Response res = await http.get(Uri.parse(url));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}