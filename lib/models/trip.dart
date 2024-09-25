enum Season {
  Winter,
  Summer,
  Fall,
  Spring,
}

enum TripType {
  Exploration,
  Recovery,
  Therapy,
  Activities,
}

class Trip {
  final String id, title, imageUrl;
  final List<String> categories, activities, program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInWinter;
  final bool isForFamilies;
  final bool isInSummer;

  const Trip({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}
