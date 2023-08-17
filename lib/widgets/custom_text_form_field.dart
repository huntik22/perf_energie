import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatefulWidget {
  final String? text;
  CustomTextFormField({Key? key, @required this.text}) : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    if (widget.text!=null) textEditingController.text = widget.text!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        //onChanged: (val) => email = val,
        decoration: InputDecoration(
            hintText: "",
            contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2
                )
            )
        ),
      ),
    );
  }
}
