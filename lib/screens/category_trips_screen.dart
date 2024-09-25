import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  // final String categoryId, CategoryTitle;
  // CategoryTripsScreen(this.categoryId, this.CategoryTitle);
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;

  const CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    //final
    categoryTitle = routeArgument['title']!;
    final categoryId = routeArgument['id'];

    //final filteredTrips
    displayTrips = //Trips_data
        widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // STP 3 Final
    // final routeArgument =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    // final categoryTitle = routeArgument['title'];
    // final categoryId = routeArgument['id'];

    // final filteredTrips = Trips_data.where((trip) {
    //   return trip.categories.contains(categoryId);
    // }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TripItem(
              // displayTrips <= filterdTrips
              id: displayTrips[index].id,
              title: displayTrips[index].title,
              imageUrl: displayTrips[index].imageUrl,
              duration: displayTrips[index].duration,
              tripType: displayTrips[index].tripType,
              season: displayTrips[index].season,
              removeItem: _removeTrip,
            );
          },
          itemCount: displayTrips.length),
    );
  }
}
