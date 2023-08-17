import 'package:flutter/material.dart';

import '../../../../../modules/styled_scrollview.dart';
// import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/customtext.dart';

class PasswordPilote extends StatefulWidget {
  const PasswordPilote({Key? key}) : super(key: key);

  @override
  State<PasswordPilote> createState() => _PasswordPiloteState();
}

class _PasswordPiloteState extends State<PasswordPilote> {
  @override
  Widget build(BuildContext context) {
    return StyledScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Card(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Mot de passe actuel",size: 15,),
                    SizedBox(height: 5,),
                    CustomTextFormField(),
                    SizedBox(height:10,),
                    CustomText(text: "Vérification du mot de passe",size: 15,),
                    SizedBox(height: 5,),
                    CustomTextFormField(),
                  ],
                )),
                SizedBox(width: 20,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Nouveau mot de passe",size: 15,),
                    SizedBox(height: 5,),
                    CustomTextFormField(),
                  ],
                ))
              ],
            ),
          ),),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(
                      color: Colors.amber,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Center(child: CustomText(text: "Enregistrer",size: 20,weight: FontWeight.bold,color: Colors.white,)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
