class StateModel {
  String? stateId;
  String? stateName;
  List<City>? city;

  StateModel({this.stateId, this.stateName, this.city});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      stateId: json['stateId'],
      stateName: json['stateName'],
      city: (json['city'] as List<dynamic>)
          .map((cityJson) => City.fromJson(cityJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'stateId': stateId,
      'stateName': stateName,
      'city': city?.map((city) => city.toJson()).toList(),
    };
    return data;
  }
}

class City {
  String? cityId;
  String? cityName;

  City({this.cityId, this.cityName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['cityId'],
      cityName: json['cityName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'cityId': cityId,
      'cityName': cityName,
    };
    return data;
  }
}
