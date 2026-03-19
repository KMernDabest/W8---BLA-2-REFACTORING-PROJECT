import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final LocationRepository locationRepository;

  late final List<Location> _locations;

  RidePreferenceRepositoryMock({
    required this.locationRepository,
  }) {
    _locations = locationRepository.getAvailableLocations();
  }

  late final List<RidePreference> _history = [
    RidePreference(
      departure: _locations[0], // London
      arrival: _locations[1],   // Manchester
      departureDate: DateTime(2026, 4, 1, 9, 0),
      requestedSeats: 1,
    ),
    RidePreference(
      departure: _locations[5], // Paris
      arrival: _locations[6],   // Lyon
      departureDate: DateTime(2026, 4, 5, 14, 30),
      requestedSeats: 2,
    ),
    RidePreference(
      departure: _locations[10], // Madrid
      arrival: _locations[11],   // Barcelona
      departureDate: DateTime(2026, 4, 10, 8, 0),
      requestedSeats: 1,
    ),
    RidePreference(
      departure: _locations[2], // Birmingham
      arrival: _locations[3],   // Edinburgh
      departureDate: DateTime(2026, 4, 15, 11, 0),
      requestedSeats: 3,
    ),
  ];

  @override
  List<RidePreference> getPreferenceHistory() {
    return List.unmodifiable(_history);
  }

  @override
  void addPreferenceToHistory(RidePreference preference) {
    _history.add(preference);
  }
}