import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/model/city_model.dart';

class CityService {
  fetchCities(String stateId) async {
    final response = await http.get(
        Uri.parse('http://api.minebrat.com/api/v1/states/cities/$stateId'));
    final jsonData = await jsonDecode(response.body);
    List data = [];
    for (int i = 0; i < jsonData.length; i++) {
      data.add(CityModel.fromJson(jsonData[i]));
    }
    print(data);

    return data;
  }
}
