import 'package:flutter/cupertino.dart';

class NotAvailableYet extends StatelessWidget {
  const NotAvailableYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Fonctionnalité bientôt disponible'));
  }
}