import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/model/detail_model.dart';
import 'package:test/model/state_model.dart';
import 'package:test/service/state_services.dart';
import 'package:test/view/details/detail_screen.dart';
import 'package:test/view/states/state_screen.dart';

class InputScreen extends StatefulWidget {
  InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

enum SingingCharacter { Male, Female }

class _InputScreenState extends State<InputScreen> {
  TextEditingController nameController = TextEditingController();
  String? gender;

  SingingCharacter? _character = SingingCharacter.Male;

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: kheight * 0.01,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your Name'),
            ),
            SizedBox(
              height: kheight * 0.02,
            ),
            const Text(
              'Select your Gender',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: kheight * 0.02,
            ),
            Row(
              children: [
                Radio<SingingCharacter>(
                  value: SingingCharacter.Male,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      gender = 'Male';
                      _character = value;
                    });
                  },
                ),
                SizedBox(
                  width: kwidth * 0.02,
                ),
                const Text(
                  'Male',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Row(
              children: [
                Radio<SingingCharacter>(
                  value: SingingCharacter.Female,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      gender = 'Female';
                      _character = value;
                    });
                  },
                ),
                SizedBox(
                  width: kwidth * 0.02,
                ),
                const Text(
                  'Female',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty && gender != null) {
                        DetailModel.name = nameController.text;
                        DetailModel.gender = gender;

                        List<StateModel> result =
                            await StateService().fetchStates();
                        if (result.isNotEmpty) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StateScreen(States: result),
                          ));
                        }
                      } else {
                        Fluttertoast.showToast(msg: 'Please Fill Data');
                      }
                    },
                    child: const Text('Submit')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
