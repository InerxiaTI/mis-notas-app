import 'package:flutter/material.dart';
import 'package:mis_notas/widgets/CustomBottomNavigationWidget.dart';

import '../widgets/SemesterInfoWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas Udea'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: SemesterInfoWidget(),
      bottomNavigationBar: CustomBottomNavigationWidget(),
    );
  }
}
