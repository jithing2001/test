import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/model/state_model.dart';

class StateService {
  fetchStates() async {
    final response =
        await http.get(Uri.parse('http://api.minebrat.com/api/v1/states'));
    final jsonData = await jsonDecode(response.body);
    List<StateModel> data = [];
    for (int i = 0; i < jsonData.length; i++) {
      data.add(StateModel.fromJson(jsonData[i]));
    }
    print(data);

    return data;
  }
}
