import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_auth/uni_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  UniAuth.init(
    auth: FirebaseAuth.instance,
    locale: const Locale('en'),
    baseUrl: 'YOUR_BASE_URL',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uni-Auth-Example',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Uni-Auth-Example', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Create User With Email & Password'),
              ElevatedButton(
                onPressed: () async {
                  final result = await UniAuthService.createUserWithEmail(
                    authData: AuthData(
                      email: 'YOUR_EMAIL',
                      password: 'YOUR_PASSWORD',
                    ),
                  );
                  if (result.isSuccess) {
                    debugPrint('User Created : ${result.user}');
                  } else {
                    debugPrint('Error : ${result.errorMessage}');
                  }
                },
                child: const Text('Create User'),
              ),
              const Text('Check If User Logged In'),
              ElevatedButton(
                onPressed: () async {
                  final result = UniAuthService.checkUserLoggedIn;
                  debugPrint('User Logged In : $result');
                },
                child: const Text('Check If User Logged In'),
              ),
              const SizedBox(height: 10),
              UniAuthService.checkSignInState(
                holder: const Text('Check If User Logged In Wrapper Builder'),
                onLoggedIn: () {
                  debugPrint('User Logged In');
                },
                onNotLoggedIn: () {
                  debugPrint('User Not Logged In');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
