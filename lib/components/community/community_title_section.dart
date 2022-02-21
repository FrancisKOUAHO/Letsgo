import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(left: 5),
        child: const Text('Community')
      ),
    );
  }
}
