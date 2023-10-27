import 'package:flutter/material.dart';

class OccupiedList extends StatefulWidget {
  const OccupiedList({super.key});

  @override
  State<OccupiedList> createState() => _OccupiedListState();
}

Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

class _OccupiedListState extends State<OccupiedList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for(int i=0 ; i<10 ; i++)
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Container(
                      width: 170,
                      height: 225,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0,3),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/image1.png",
                              height: 130,
                            ),
                            const Text("105 (2 BHK)",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, ),),
                            const SizedBox(height: 4.0,),
                            const Text("Apartment",style: TextStyle(fontSize:18, ),),
                            const SizedBox(height: 15.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₹2,800 / Day",style: TextStyle(fontSize: 16,color: customColor,fontWeight: FontWeight.bold),),
                                const Icon(Icons.favorite_border,color: Colors.redAccent,size: 16,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              children: [
                for(int i=0 ; i<10 ; i++)
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Container(
                      width: 170,
                      height: 225,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0,3),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/image1.png",
                              height: 130,
                            ),
                            const Text("105 (2 Sharing)",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, ),),
                            const SizedBox(height: 4.0,),
                            const Text("PG",style: TextStyle(fontSize:18, ),),
                            const SizedBox(height: 15.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₹800 / Day",style: TextStyle(fontSize: 16,color: customColor,fontWeight: FontWeight.bold),),
                                const Icon(Icons.favorite_border,color: Colors.redAccent,size: 16,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
