import 'package:facebook/models/country.dart';
import 'package:facebook/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final countryNameController = TextEditingController();
  List<Country> countryList = [];

  void removeName(Country country) {
    setState(() {
      countryList.remove(country);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TextField(
            controller: countryNameController,
          ),
          IconButton(
            onPressed: () {
              String name = countryNameController.text;
              Country country = Country(code: 92, name: name);
              countryList.add(country);
              countryNameController.clear();
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
          countryList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: countryList.length,
                    itemBuilder: (context, index) => HomeCard(
                      country: countryList[index],
                      removeName: removeName,
                    ),
                  ),
                )
              : const Text('No Item'),
        ],
      ),
    );
  }
}
