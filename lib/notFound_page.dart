import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Container(
      decoration: const BoxDecoration(
        image:DecorationImage(image: AssetImage("assets/images/error.png"))
      ),
    )
    );
  }
}