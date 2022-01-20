import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBoxTitleSection extends StatelessWidget {
  const UserBoxTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Let's GO,",
                style: GoogleFonts.lato(textStyle: LetsGoTheme.bigTitle)),
            Text("Marina!",
                style: GoogleFonts.lato(textStyle: LetsGoTheme.bigTitle))
          ],
        ),
      ),
    );
  }
}
