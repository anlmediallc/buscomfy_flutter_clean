import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/login_error_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/create_new_password_screen.dart';
import 'screens/register_screen.dart';
import 'screens/my_account_screen.dart';
import 'screens/luggage_check_in_screen.dart';
import 'screens/notification_center_screen.dart';
import 'screens/personal_info_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/help_center_screen.dart';
import 'screens/report_problem_screen.dart';
import 'screens/trip_details_screen.dart';
import 'screens/trip_stops_screen.dart';
import 'screens/verification_screen.dart';

void main() {
  runApp(const BuscomfyApp());
}

class BuscomfyApp extends StatelessWidget {
  const BuscomfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscomfy+',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Inter'),
      initialRoute: '/',
      routes: {
        '/': (context) => const BuscomfySplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/login-error': (context) => const LoginErrorScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/create-new-password': (context) => const CreateNewPasswordScreen(),
        '/register': (context) => const RegisterScreen(),
        '/my-account': (context) => const MyAccountScreen(),
        '/luggage-check-in': (context) => const LuggageCheckInScreen(),
        '/notifications': (context) => const NotificationCenterScreen(),
        '/personal-info': (context) => const PersonalInfoScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/help-center': (context) => const HelpCenterScreen(),
        '/report-problem': (context) => const ReportProblemScreen(),
        '/trip-details': (context) => const TripDetailsScreen(),
        '/trip-stops': (context) => const TripStopsScreen(),
        '/verification': (context) => const VerificationScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
