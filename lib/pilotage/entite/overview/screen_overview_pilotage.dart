import 'package:flutter/material.dart';
import '../../../../helper/helper_methods.dart';
import '../../../../widgets/privacy_widget.dart';
import 'overview_pilotage.dart';

class ScreenOverviewPilotage extends StatefulWidget {
  /// Constructs a [ScreenOverviewPilotage] widget.
  const ScreenOverviewPilotage({Key? key}) : super(key: key);

  @override
  State<ScreenOverviewPilotage> createState() => _ScreenOverviewPilotageState();
}

class _ScreenOverviewPilotageState extends State<ScreenOverviewPilotage> {
  bool _isLoaded = false;
  late ScrollController _scrollController;

  void loadScreen() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadScreen();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.round();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 16, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Accueil",
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF3C3D3F),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            _isLoaded
                ? Expanded(
                    child: Theme(
                    data: Theme.of(context).copyWith(
                        scrollbarTheme: ScrollbarThemeData(
                      trackColor: MaterialStateProperty.all(Colors.black12),
                      trackBorderColor:
                          MaterialStateProperty.all(Colors.black38),
                      thumbColor: MaterialStateProperty.all(Color(0xFF80868B)),
                      interactive: true,
                    )),
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      thickness: 8,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Column(
                            children: const [
                              OverviewPilotage(),
                              SizedBox(
                                height: 20,
                              ),
                              // PrivacyWidget(),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
                : Expanded(
                    child: Column(
                      children: [
                        /* Expanded(
                            child: Center(
                          child:
                              loadingPageWidget(), //const SpinKitRipple(color: Colors.blue,),
                        )), */
                        SizedBox(
                          height: 20,
                        ),
                        // PrivacyWidget(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
