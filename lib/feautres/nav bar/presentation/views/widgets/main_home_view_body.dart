import 'package:flutter/material.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
        padding:  EdgeInsets.all(20),
        child: SizedBox(
          child:  Text('Test View'),
        ) ,
      ),
    );
  }
}