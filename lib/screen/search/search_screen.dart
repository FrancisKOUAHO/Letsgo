import 'package:flutter/material.dart';
import 'package:letsgo/components/search/search_user_section.dart';
import 'package:letsgo/components/search/search_search_section.dart';
import 'package:letsgo/components/search/search_maps_section.dart';
import 'package:letsgo/components/search/search_list_aventure.dart';
import 'package:letsgo/components/search/search_title_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            SearchUserSection(),
            SearchSearchSection(),
            SearchMapsSection(),
            SearchTitleSection(),
            SearchListAventure(),
          ],
        ),
      ),
    );
  }
}
