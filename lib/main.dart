import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/category_trips_screen.dart';
import './app_data.dart';
import 'package:travel_app/models/trip.dart';
import './screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/trip_detail_screen.dart';
import './screens/filterd_screen.dart';
import './screens/chat_screen.dart';
import './screens/registration_screen.dart';
import './screens/signin_screen.dart';
import './screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrip = Trips_data;

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // English
      ],
      title: 'Travel app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Elmessiri',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
          tertiary: Colors.green, // Add your desired accent color here
        ),

        //colorScheme: Colors.amber,
        //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'Elmessiri',
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'Elmessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: _auth.currentUser != null
          ? TabsScreen.screenRoute
          : WelcomeScreen.screenRoute,

      routes: {
        // '/': (context) => const TabsScreen(), //instead of home
        TabsScreen.screenRoute: (context) => TabsScreen(),
        CategoryTripsScreen.screenRoute: (context) => CategoryTripsScreen(
            _availableTrips), //STP 1 then goto what u want to pass to CategoryTripsScreen
        TripDetailScreen.screenRoute: (context) => const TripDetailScreen(),
        FilterdScreen.screenRoute: (context) =>
            FilterdScreen(_filters, _changeFilters),
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SignInScreen.screenRoute: (context) => SignInScreen(),
        RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
      },
    );
  }
}
