import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSubTitleSection extends StatefulWidget {
  const HomeSubTitleSection({Key? key}) : super(key: key);

  @override
  _HomeSubTitleSectionState createState() => _HomeSubTitleSectionState();
}

class _HomeSubTitleSectionState extends State<HomeSubTitleSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Text("Theme",
            style: GoogleFonts.lato(textStyle: LetsGoTheme.sliderTitle)),
      ),
    );;
  }
}
