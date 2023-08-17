import 'package:flutter/material.dart';

import '../../../../../modules/styled_scrollview.dart';
// import '../../../../../widgets/custom_text.dart';
// import '../../../../../widgets/custom_text_form_field.dart';
import '../../../../../widgets/menu_deroulant.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/customtext.dart';


class InfosPilote extends StatefulWidget {
  const InfosPilote({Key? key}) : super(key: key);

  @override
  State<InfosPilote> createState() => _InfosPiloteState();
}

class _InfosPiloteState extends State<InfosPilote> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Expanded(child: Container(
          child: StyledScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFFFFF00),
                        child: Center(
                          child: CustomText(
                            text: "SE",
                            color: Color(0xFFF1C232),
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        'Serge EBRA',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('sergeebra@sucrivoire.ci'),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const CustomText(text: "Pilote",size: 20,weight: FontWeight.bold,),
                Card(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Prénom",size: 15,),
                          SizedBox(height: 5,),
                          CustomTextFormField(text: "Serge",),
                          SizedBox(height:10,),
                          CustomText(text: "Titre",size: 15,),
                          SizedBox(height: 5,),
                          MenuDeroulant(
                            indication: "",
                            initValue: "M.",
                            height: 50,
                            items: ["M.","Mme","Mlle.","Miss"],
                          ),
                        ],
                      )),
                      SizedBox(width: 20,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Nom",size: 15,),
                          SizedBox(height: 5,),
                          CustomTextFormField(text: "EBRA",),
                        ],
                      ))
                    ],
                  ),
                ),),
                const SizedBox(height: 10,),
                const CustomText(text: "Contacts",size: 20,weight: FontWeight.bold,),
                Card(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Numéro de téléphone",size: 15,),
                          SizedBox(height: 5,),
                          CustomTextFormField(text: '+225 0757360442'),
                          SizedBox(height:10,),
                          CustomText(text: "Pays",size: 15,),
                          SizedBox(height: 5,),
                          MenuDeroulant(
                            indication: "",
                            initValue: "COTE D'IVOIRE",
                            height: 50,
                            items: ["COTE D'IVOIRE","GHANA","FRANCE","LIBERAI"],
                          ),
                          SizedBox(height:10,),
                          CustomText(text: "Ville",size: 15,),
                          SizedBox(height: 5,),
                          CustomTextFormField(text: 'Abidjan'),
                          SizedBox(height:10,),
                          CustomText(text: "Adresse",size: 15,),
                          SizedBox(height: 5,),
                          CustomTextFormField(text: 'Cocody'),
                        ],
                      )),
                      SizedBox(width: 20,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Filiale",size: 15,),
                          SizedBox(height: 5,),
                          textNonModifiable("SUCRIVOIRE"),
                          SizedBox(height:10,),
                          CustomText(text: "Entité",size: 15,),
                          SizedBox(height: 5,),
                          textNonModifiable("Sucrivoire Siège"),
                          SizedBox(height:10,),
                          CustomText(text: "Fonction",size: 15,),
                          SizedBox(height: 5,),
                          CustomTextFormField(text: 'Responsable DD'),
                        ],
                      ))
                    ],
                  ),
                ),),
              ],
            ),
          ),
        )),
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
