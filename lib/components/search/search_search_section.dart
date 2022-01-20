import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSearchSection extends StatelessWidget {
  const SearchSearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: TextField(
            style: GoogleFonts.lato(textStyle: LetsGoTheme.search),
            decoration: InputDecoration(
              fillColor: LetsGoTheme.lightPurple,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              suffixIcon: Icon(Icons.search, color: LetsGoTheme.main),
              hintText: "Rechercher des activité ...",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
