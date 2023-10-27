import 'package:absolute_stay/usable/RoomTypeOption.dart';
import 'package:absolute_stay/usable/container_button.dart';
import 'package:flutter/material.dart';


class PropertySpecificationPopUp extends StatefulWidget {
  const PropertySpecificationPopUp({super.key});


  @override
  State<PropertySpecificationPopUp> createState() => _PropertySpecificationPopUpState();
}

class _PropertySpecificationPopUpState extends State<PropertySpecificationPopUp> {
  final TextStyle tstyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  final TextStyle tstyle2 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Room Type:',style: tstyle,),
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '1 ', tstyle2: tstyle2),
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '2 ', tstyle2: tstyle2),
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '3 ', tstyle2: tstyle2),
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '4 ', tstyle2: tstyle2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender:',style: tstyle,),
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                Container(
                                    padding: const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.grey.shade100,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade50,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          )
                                        ]
                                    ),
                                    child: Text('Male',style: tstyle2,)),
                                const SizedBox(width: 10,),
                                Row(
                                  children: [
                                    const SizedBox(width: 10,),
                                    Container(
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.grey.shade100,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade50,
                                              blurRadius: 4,
                                              spreadRadius: 2,
                                            )
                                          ]
                                      ),
                                    child: Text('Female',style: tstyle2,)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Prize:',style: tstyle,),
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '10 ', tstyle2: tstyle2),
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '20 ', tstyle2: tstyle2),
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '30 ', tstyle2: tstyle2),
                                  const SizedBox(width: 10),
                                  RoomTypeOption(text: '40', tstyle2: tstyle2),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {}, // Pass context here
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                }
                                return const Color.fromRGBO(33, 37, 41, 1.0);
                              },
                            ),
                          ),
                          child: const Text(
                            'Cancel Order',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {}, // Pass context here
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 37, 41, 1.0);
                                }
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              },
                            ),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: ContainerButton(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        text: 'Book Now',
        bgColor: customColor,
      ),
    );
  }
}
