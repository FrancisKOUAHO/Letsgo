import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3, // 20%
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 190,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: LetsGoTheme.lightPurple,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(Icons.location_on_rounded, size: 25),
                            title: Text('Saint-Ouen, France',
                                style: TextStyle(
                                    color: LetsGoTheme.black, fontSize: 11)),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 190,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/Splash.png"), // no matter how big it is, it won't overflow
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              color: Colors.red),
        ),
        Expanded(
          flex: 6, // 60%
          child: Container(color: Colors.green),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(color: Colors.blue),
        )
        //your widgets here...
      ],
    );
  }
}
