import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_id_verification/firebase_options.dart';
import 'package:student_id_verification/pages/Home.dart';
import 'package:student_id_verification/pages/HomePage.dart';
import 'package:student_id_verification/pages/SignIn.dart';
import 'package:student_id_verification/pages/SignUp.dart';
import 'package:student_id_verification/pages/drawer.dart';
import 'package:student_id_verification/pages/on_Boarding.dart';
import 'package:student_id_verification/providers/user_provider.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
          ],
//          StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: ((context, snapshot) {
//             if (snapshot.hasData) {
//               ref.watch(userProvider.notifier).Login(snapshot.data!.email!);
//               return const HomePage();
//             }else
//             {
// return const SignIn();
//             }
              
//           }),
//         )
        ));
  }
}
