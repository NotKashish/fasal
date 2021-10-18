import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/farmers/farmers_chat.dart';
import 'package:fasal/screens/farmers/upload_produce.dart';
import 'package:fasal/screens/farmers/view_wholesalers.dart';
import 'package:fasal/screens/profile_page.dart';

import 'drawer.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  _HelplineState createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('Kisan helpline numbers'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Text(
          'The Department of Agriculture & Cooperation (DAC), Ministry of Agriculture, Govt. of India launched Kisan Call Centers on January 21, 2004 across the country to deliver extension services to the farming community.The purpose of these call centers is to respond to issues raised by farmers, instantly, in the local language. There are call centers for every state which are expected to handle traffic from any part of the country. Queries related to agriculture and allied sectors are being addressed through these call centers.A farmer from any part of the State can contact the Kisan Call Centre by dialing the toll free Telephone No. 1551 or 1800-180-1551 and present their problems/queries related to farming. The operator at the Kisan Call centre will attempt to answer the problems/queries of the farmers immediately. In case the operator at the Call Centre is not able to address the farmers query immediately, the call will be forwarded to identified agricultural specialists',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
