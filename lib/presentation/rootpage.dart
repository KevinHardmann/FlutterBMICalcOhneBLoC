import 'package:flutter/material.dart';

import 'Widget/BMIMainPage.dart';

class BMIPage extends StatelessWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BMICalcPage(),
      );
  }
}
