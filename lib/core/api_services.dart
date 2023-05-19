import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/category.dart';
import 'model/donor.dart';

Future<Category> fetchDashboard() async {
  var response = await http
      .get(Uri.parse('https://10.0.2.2:7178/api/Doner/countByCategory'));

  print(response.body);
  var jsonList = json.decode(response.body);
  return Category.fromJson(jsonList);
}

Future<List<Donor>> fetchDonor() async {
  try {
    var response = await http
        .get(Uri.parse('https://10.0.2.2:7178/api/Doner/getAllDonor'));

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((jsonObject) => Donor.fromJson(jsonObject)).toList();
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
