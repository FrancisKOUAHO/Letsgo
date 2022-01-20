import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityTitleSection extends StatefulWidget {
  const CommunityTitleSection({Key? key}) : super(key: key);

  @override
  _CommunityTitleSectionState createState() => _CommunityTitleSectionState();
}

class _CommunityTitleSectionState extends State<CommunityTitleSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5),
        child: Text('Community',
            style: GoogleFonts.lato(textStyle: LetsGoTheme.Title)),
      ),
    );
  }
}
