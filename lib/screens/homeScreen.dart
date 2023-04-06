import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/location_model.dart';
import 'package:flutter_challenge/services/service.dart';
import 'package:flutter_challenge/widgets/listview_item.dart';

class HomeScreenOne extends StatefulWidget {
  // I designed the home screen for the main page of this app
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  //use to getting the value of TextField widget
  TextEditingController editingController = TextEditingController();

  //the main list of our data
  List<Location>? displayList;

  //I use this methode to call api at the first and save that in service variable
  var service = myService().get("Suchtext");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Stop Finder"),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.all(12),
              width: size.width,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    //check the value enter in TextField and search in our list with onChanged methode
                    service = myService().get(value);
                  });

                  //this condition for the time we delete every things we clear and rebuild the list again
                  //I use this "Suchtext" just for test because I don't know the main value for show all the locations
                  if (value.isEmpty) {
                    service = myService().get("Suchtext");
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search The Location ...",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: service,
                builder: (context, snapshot) {
                  displayList = snapshot.data;
                  return displayList != null
                      ? listViewItem(displayList, context)
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            )
          ],
        ));
  }
}
