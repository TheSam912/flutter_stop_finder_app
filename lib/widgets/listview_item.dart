import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/location_model.dart';

//I design and use listViewItem for items in list
// used list as a "loc" for calling this widget to fill the list
// and check donditions for showing different view or color
//check "isBest" value and show a check icon at the top corner of widget with green color to showing suggestion better

Widget listViewItem(List<Location>? loc, BuildContext context) {
  final widthSize = MediaQuery.of(context).size.width;
  return ListView.builder(
    itemCount: loc!.length,
    itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                  width: widthSize,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(0, 10),
                            blurRadius: 20)
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      color: loc[index].isBest == true
                          ? Colors.green.shade100
                          : Colors.white),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Image(
                              image: AssetImage('assets/images/map.png'),
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Type: ${loc[index].type}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "MatchQuality: ${loc[index].matchQuality}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      loc[index].isBest == true
                          ? Positioned(
                              top: 0,
                              right: 15,
                              child: RotatedBox(
                                quarterTurns: 45,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: Colors.green),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Best",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          : Container(),
                    ],
                  )),
              Container(
                width: widthSize,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: Colors.blueAccent),
                child: Center(
                    child: Text(
                  "${loc[index].name}",
                  style: const TextStyle(color: Colors.white),
                )),
              ),
            ],
          ));
    },
  );
}
