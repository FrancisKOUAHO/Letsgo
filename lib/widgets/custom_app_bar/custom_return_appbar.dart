import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/letsgo_theme.dart';

class CustomReturnAppBar extends StatefulWidget {
  final String pageTitle;
  const CustomReturnAppBar(this.pageTitle, {Key? key}) : super(key: key);

  @override
  State<CustomReturnAppBar> createState() => _CustomReturnAppBarState();
}

class _CustomReturnAppBarState extends State<CustomReturnAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 100,
      centerTitle: true,
      title: Text(
        widget.pageTitle,
        style: const TextStyle(color: LetsGoTheme.black),
      ),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: const Color(0x3A000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Container(
                color: LetsGoTheme.lightPurple,
                width: 45,
                height: 45,
                child: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: LetsGoTheme.main,
                  ),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
