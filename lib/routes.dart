import 'package:flutter/material.dart';
import 'package:filipino_cuisinero/home/home.dart';
import 'package:filipino_cuisinero/favorites/favorites.dart';
import 'package:filipino_cuisinero/profile/profile.dart';
import 'package:filipino_cuisinero/login/login.dart';
import 'package:filipino_cuisinero/login/signup.dart';

Map<String, Widget Function(dynamic)> routes = {
  "home": (context) => const HomeScreen(),
  "profile": (context) => const Profile(),
  "favorites": (context) => const Favorites(),
  "login": (context) => const LoginScreen(),
  "signup": (context) => const SignupScreen(),
};
