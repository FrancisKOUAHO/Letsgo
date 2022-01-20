import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTitleSection extends StatelessWidget {
  const SearchTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 105, right: 105),
                child: Divider(
                  color: Colors.black,
                )),
            Text("AFFFICHER LA LISTE")
          ],
        )),
      ),
    );
  }
}
