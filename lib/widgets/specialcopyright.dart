import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/widgets/customtext.dart';
import 'customtext.dart';

class Specialcopyright extends StatelessWidget {
  const Specialcopyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF313030),
        border: Border.all(color: Color(0xFF313030), width: 1.0),
      ),
      child: Row(
        children:[
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          const Text(
            "@ 2023 vision & strategie groupe",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 80,),
          TextButton(
            onPressed: () {
              context.go('');
            },
            child: const CustomText(
              text: "Confidentialité",
              color: Color((0xFFFF7700)),
            ),
          ),
          TextButton(
            onPressed: () {
              context.go('');
            },
            child: const CustomText(
              text: "Conditions d'utilisation",
              color: Color((0xFFFF7700)),
            ),
          ),
          SizedBox(width: 20,),
        ],
          ),
          )
        ]
      ),
    );      
  }
}
