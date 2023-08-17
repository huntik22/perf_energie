import 'package:flutter/material.dart';

import '../../../../../modules/styled_scrollview.dart';
// import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/menu_deroulant.dart';
import '../../../../widgets/customtext.dart';


class InfosCompte extends StatefulWidget {
  const InfosCompte({Key? key}) : super(key: key);

  @override
  State<InfosCompte> createState() => _InfosCompteState();
}

class _InfosCompteState extends State<InfosCompte> {
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
                    CustomText(text: "Email utilisateur",size: 15,),
                    SizedBox(height: 5,),
                    textNonModifiable("sergeebra@gmail.com"),
                    SizedBox(height:10,),
                    CustomText(text: "Type d'accès",size: 15,),
                    SizedBox(height: 5,),
                    textNonModifiable("Collecteur")
                  ],
                )),
                SizedBox(width: 20,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Langue",size: 15,),
                    SizedBox(height: 5,),
                    MenuDeroulant(
                      indication: "",
                      initValue: "Française",
                      width: double.maxFinite,
                      height: 50,
                      items: ["Française","English",],
                    )
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

  Widget textNonModifiable(String text){
    return Container(
        height: 50,
        alignment: Alignment.centerLeft,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: Color(0xFFF2F4F5),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(text,style: const TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),),
        ));
  }
}

