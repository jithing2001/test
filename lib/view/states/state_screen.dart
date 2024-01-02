import 'package:flutter/material.dart';
import 'package:test/model/detail_model.dart';
import 'package:test/model/state_model.dart';
import 'package:test/service/city_services.dart';
import 'package:test/view/home/city/city_screen.dart';

List searchList = [];

class StateScreen extends StatefulWidget {
  List<StateModel> States;
  StateScreen({super.key, required this.States});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  String? stateName;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    searchList.addAll(widget.States);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('States'),
        actions: [
          SizedBox(
            height: 2,
            width: 100,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search here'),
              onChanged: (value) {
                onchangedMethod();
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              stateName = searchList[index].stateName;
              final List result =
                  await CityService().fetchCities(searchList[index].stateId!);
              if (result.isNotEmpty) {
                DetailModel.State = stateName;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CityScreen(cities: result),
                ));
              }
            },
            child: ListTile(
              title: Text(searchList[index].stateName!),
            ),
          );
        },
      ),
    );
  }

  onchangedMethod() {
    String searchText = searchController.text.toLowerCase();
    setState(() {
      searchList = widget.States.where(
              (state) => state.stateName!.toLowerCase().contains(searchText))
          .toList();
    });
  }
}
