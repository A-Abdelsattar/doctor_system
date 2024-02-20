import 'package:doctor/core/services/dio_helper/dio_helper.dart';
import 'package:doctor/core/services/sp_helper/sp_helper.dart';
import 'package:doctor/features/auth_view/view/auth_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedPreferenceHelper.init();
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthView(),
    );
  }
}
