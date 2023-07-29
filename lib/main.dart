import 'package:flutter/material.dart';
import 'package:innroom/components/forms/signin.dart';
import 'package:innroom/components/loginform.dart';
import 'package:innroom/screens/auth_screen.dart';
import 'package:innroom/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/forms/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDRkMtmH41Em0VK00h0DDaYTnygCOse-vw",
      authDomain: "innroom-72740.firebaseapp.com",
      projectId: "innroom-72740",
      storageBucket: "innroom-72740.appspot.com",
      messagingSenderId: "143265940294",
      appId: "1:143265940294:web:7395491ada6b2e16b29b47",
      measurementId: "G-84Q79EHX7S",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _intialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InnRoom',
      home: Directionality(
        textDirection: TextDirection.ltr, // Set the appropriate direction here
        child: FutureBuilder(
          future: _intialization,
          builder: (context, snapshot) {
            // Check if the Firebase initialization has completed
            if (snapshot.connectionState == ConnectionState.done) {
              // If initialization is complete, check for errors
              if (snapshot.hasError) {
                // Handle error if any
                return const SomethingWentWrong();
              } else {
                // Initialization succeeded, proceed with the app
                return const AuthScreen(); // Assuming HomeScreen is your default route
              }
            } else {
              // Show a loading indicator until Firebase initialization is complete
              return const LoadingScreen();
            }
          },
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AuthScreen.routeName: (context) => const AuthScreen(),
        LoginForm.routeName: (context) => const LoginForm(),
        SignInForm.routeName: (context) => const SignInForm(),
        SignUpForm.routeName: (context) => const SignUpForm(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: AuthScreen.routeName,
    );
  }
}

// Define loading and error screens to display while initializing Firebase
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Something went wrong!"),
      ),
    );
  }
}
