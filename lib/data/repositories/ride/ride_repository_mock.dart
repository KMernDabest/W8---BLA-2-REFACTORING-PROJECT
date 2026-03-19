import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/user/user_repository.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/model/user/user.dart';

class RideRepositoryMock implements RideRepository {
  final LocationRepository locationRepository;
  final UserRepository userRepository;

  late final List<Location> _locations;
  late final List<User> _users;

  RideRepositoryMock({
    required this.locationRepository,
    required this.userRepository,
  }) {
    _locations = locationRepository.getAvailableLocations();
    _users = userRepository.getAllUsers();
  }

  late final List<Ride> _rides = [
    Ride(
      departureLocation: _locations[0], // London
      arrivalLocation: _locations[1],   // Manchester
      departureDate: DateTime(2026, 4, 1, 9, 0),
      arrivalDateTime: DateTime(2026, 4, 1, 12, 30),
      driver: _users[0], // Alice
      availableSeats: 3,
      pricePerSeat: 15.0,
    ),
    Ride(
      departureLocation: _locations[0], // London
      arrivalLocation: _locations[1],   // Manchester
      departureDate: DateTime(2026, 4, 1, 14, 0),
      arrivalDateTime: DateTime(2026, 4, 1, 17, 30),
      driver: _users[1], // Bob
      availableSeats: 2,
      pricePerSeat: 12.0,
    ),
    Ride(
      departureLocation: _locations[5], // Paris
      arrivalLocation: _locations[6],   // Lyon
      departureDate: DateTime(2026, 4, 5, 14, 30),
      arrivalDateTime: DateTime(2026, 4, 5, 16, 30),
      driver: _users[2], // Claire
      availableSeats: 4,
      pricePerSeat: 18.0,
    ),
    Ride(
      departureLocation: _locations[10], // Madrid
      arrivalLocation: _locations[11],   // Barcelona
      departureDate: DateTime(2026, 4, 10, 8, 0),
      arrivalDateTime: DateTime(2026, 4, 10, 13, 30),
      driver: _users[3], // Diego
      availableSeats: 2,
      pricePerSeat: 22.0,
    ),
    Ride(
      departureLocation: _locations[2], // Birmingham
      arrivalLocation: _locations[3],   // Edinburgh
      departureDate: DateTime(2026, 4, 15, 11, 0),
      arrivalDateTime: DateTime(2026, 4, 15, 16, 0),
      driver: _users[4], // Emma
      availableSeats: 3,
      pricePerSeat: 25.0,
    ),
    Ride(
      departureLocation: _locations[6], // Lyon
      arrivalLocation: _locations[7],   // Marseille
      departureDate: DateTime(2026, 4, 20, 10, 0),
      arrivalDateTime: DateTime(2026, 4, 20, 13, 0),
      driver: _users[1], // Bob
      availableSeats: 1,
      pricePerSeat: 14.0,
    ),
  ];

  @override
  List<Ride> getAllRides() {
    return List.unmodifiable(_rides);
  }

  @override
  List<Ride> getRidesFor(RidePreference preference) {
    return _rides.where((ride) {
      return ride.departureLocation == preference.departure &&
          ride.arrivalLocation == preference.arrival &&
          ride.availableSeats >= preference.requestedSeats;
    }).toList();
  }
}