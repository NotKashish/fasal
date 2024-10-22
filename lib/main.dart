import 'dart:async';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/authentication/authentication_wrapper.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:fasal/styles/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'constants/keys.dart';
import 'generated/l10n.dart';
import 'helper/languageChangeProvider.dart';

Future<void> main() async {

  var test = await http.get(
      Uri.parse("$uurl/kami")
  );
  Timer(Duration(seconds: 5), ()=>debugPrint("testing: "+test.body.toString()));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (context) => AuthenticationService(FirebaseAuth.instance),
          ),


          StreamProvider(
              create: (context) => context
                  .read<AuthenticationService>().authStateChanged,
            initialData: null,
          ),


        ],
      child: MaterialApp(
       //locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      title: 'Fasal',
      theme: mainTheme,
       home: AuthenticationWrapper(),
      )
    );
  }
}

