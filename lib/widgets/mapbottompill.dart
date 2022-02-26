import 'package:flutter/material.dart';

import '../theme/letsgo_theme.dart';

class MapBottomPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Card(
            child: Container(
              height: 200,
              width: 209,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/photo_0.jpg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: const Text("YOUR TEXT", style: TextStyle(
                  color: LetsGoTheme.black, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
