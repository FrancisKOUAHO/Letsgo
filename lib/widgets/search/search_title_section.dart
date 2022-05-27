import 'package:flutter/material.dart';

class SearchTitleSection extends StatelessWidget {
  const SearchTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 105, right: 105),
            child: const Divider(
              color: Colors.black,
            )),
        const Text("AFFICHER LA LISTE")
      ],
    ));
  }
}
