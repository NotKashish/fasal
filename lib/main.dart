import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/authentication/authentication_wrapper.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

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
      title: 'Fasal',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: white,

      ),
       home: AuthenticationWrapper(),
      )
    );
  }
}

