import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(child: Text("SearchScreen")),
    );
  }
}
