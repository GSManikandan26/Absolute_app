import 'package:absolute_stay/owner/vacantCustomSwitch.dart';
import 'package:flutter/material.dart';


class VacantListPage extends StatefulWidget {
  const VacantListPage({super.key});

  @override
  State<VacantListPage> createState() => _VacantListPageState();
}

class _VacantListPageState extends State<VacantListPage> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Vacant List'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: 30,),
                VacantCustomSwitch(), // This is your custom switch widget.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
