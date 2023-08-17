import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '/modules/styled_scrollview.dart';
import '../../widgets/customtext.dart';



class OverviewExpansionItem extends StatefulWidget {
  final String title;
  final Color titleColor;
  final List<Widget> children;
  final Function()? onPressed;
  const OverviewExpansionItem(
      {Key? key,
      required this.title,
        @required this.onPressed,
      required this.titleColor,
      required this.children})
      : super(key: key);

  @override
  _OverviewExpansionItemState createState() => _OverviewExpansionItemState();
}

class _OverviewExpansionItemState extends State<OverviewExpansionItem> {
  late bool isVisible;
  @override
  void initState() {
    isVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                style: const ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: widget.onPressed,
                child: CustomText(
                  text: widget.title,
                  color: /* widget.titleColor */activeBlue,
                  weight: FontWeight.bold,
                )),
            RotatedBox(
              quarterTurns: isVisible == true ? 1 : 3,
              child: InkWell(
                  onTap: () async{
                    setState(() {
                      if (isVisible) {
                        isVisible = false;
                      } else if (isVisible == false) {
                        isVisible = true;
                      }
                    });
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: isVisible == true ? activeBlue : activeBlue,
                  )),
            )
          ],
        ),
        Visibility(
            visible: isVisible,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 100,
                width: double.maxFinite,
                child: StyledScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.children),
                ),
              ),
            ))
      ],
    );
  }
}

