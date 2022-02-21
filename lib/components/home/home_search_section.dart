import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            fillColor: LetsGoTheme.lightPurple,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            suffixIcon: const Icon(Icons.search, color: LetsGoTheme.main),
            hintText: "Rechercher des activité ...",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
