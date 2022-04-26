import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/letsgo_theme.dart';

class SelectActivityFavorites extends StatefulWidget {
  const SelectActivityFavorites({Key? key}) : super(key: key);

  @override
  _SelectActivityFavoritesState createState() =>
      _SelectActivityFavoritesState();
}

class _SelectActivityFavoritesState extends State<SelectActivityFavorites> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF4814A8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Text('Sélectionnez 4 activités ou plus que vous aimez. ',
                    textAlign: TextAlign.start, style: LetsGoTheme.selectTitle),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.05, -0.45),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 10, 40),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Recherche',
                      hintStyle:
                          const TextStyle(fontSize: 20.0, color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: LetsGoTheme.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: LetsGoTheme.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: LetsGoTheme.white,
                        size: 30,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/910/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/155/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/658/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/672/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/355/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/84/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/187/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/104/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/70/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/347/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Image.network(
                          'https://picsum.photos/seed/972/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: FlatButton(
                  child: const Text(
                    'Terminer',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: LetsGoTheme.white,
                  textColor: Colors.deepPurple,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
