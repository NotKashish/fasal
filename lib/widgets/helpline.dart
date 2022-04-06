import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helper/languageChangeProvider.dart';
import 'drawer.dart';
import 'package:fasal/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  _HelplineState createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) =>  LanguageChangeProvider(),
      //locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,


      child: Builder(
        builder: (context) => Scaffold(



            backgroundColor: eggShell,
            appBar: AppBar(
              backgroundColor: androidGreen,
              title: Text('Kisan helpline numbers'),
            ),
            // drawer: MyDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      fit: BoxFit.fill,
                      // height: 200,
                      // width: 200,
                      image: AssetImage('assets/images/4060125.jpg'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      //"k",
                      S.of(context).welcomeText,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      context.read<LanguageChangeProvider>().changeLocale("hi");
                    }, child: Text("Hindi")),
                    ElevatedButton(onPressed: (){
                      context.read<LanguageChangeProvider>().changeLocale("en");
                    }, child: Text("English")),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        TextButton(
                          onPressed: () {
                            launch(
                              ('tel: +18001801551'),
                            );
                          },
                          child: Text(
                            '+1800-180-1551',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Text(
                      'The Department of Agriculture & Cooperation (DAC), Ministry of Agriculture, Govt. of India launched Kisan Call Centers on January 21, 2004 across the country to deliver extension services to the farming community.'
                      'The purpose of these call centers is to respond to issues raised by farmers, instantly, in the local language.'
                      ' There are call centers for every state which are expected to handle traffic from any part of the country.'
                      ' Queries related to agriculture and allied sectors are being addressed through these call centers.'
                      'A farmer from any part of the State can contact the Kisan Call Centre by dialing the toll free Telephone No. 1551 or 1800-180-1551 and present their problems/queries related to farming.'
                      ' The operator at the Kisan Call centre will attempt to answer the problems/queries of the farmers immediately.'
                      'In case the operator at the Call Centre is not able to address the farmers query immediately, the call will be forwarded to identified agricultural specialists.',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}

// Text(
// 'The Department of Agriculture & Cooperation (DAC), Ministry of Agriculture, Govt. of India launched Kisan Call Centers on January 21, 2004 across the country to deliver extension services to the farming community.'
// 'The purpose of these call centers is to respond to issues raised by farmers, instantly, in the local language.'
// ' There are call centers for every state which are expected to handle traffic from any part of the country.'
// ' Queries related to agriculture and allied sectors are being addressed through these call centers.'
// 'A farmer from any part of the State can contact the Kisan Call Centre by dialing the toll free Telephone No. 1551 or 1800-180-1551 and present their problems/queries related to farming.'
// ' The operator at the Kisan Call centre will attempt to answer the problems/queries of the farmers immediately.'
// 'In case the operator at the Call Centre is not able to address the farmers query immediately, the call will be forwarded to identified agricultural specialists.',
// style: TextStyle(fontSize: 16),
// ),
