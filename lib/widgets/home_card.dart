import 'package:facebook/models/country.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.country, required this.removeName});
  final Country country;
  final void Function(Country) removeName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(country.name),
          InkWell(
            child: const Icon(Icons.delete),
            onTap: () {
              removeName(country);
            },
          ),
        ],
      ),
    );
  }
}
