
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referral_app_code/ui/get_it/get_it_setup.dart';
import 'package:referral_app_code/ui/route/route_generator.dart';
import 'package:referral_app_code/ui/views/auth_view/start_view.dart';
import 'package:referral_app_code/view_models/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GeneratedRoute.navigatorKey,
        initialRoute: StartView.routeName,
        onGenerateRoute: GeneratedRoute.onGenerate,
      ),
    );
  }
}
