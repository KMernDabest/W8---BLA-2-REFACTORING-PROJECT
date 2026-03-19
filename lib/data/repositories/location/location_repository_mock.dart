import '../../../model/ride/locations.dart';
import 'location_repository.dart';

class LocationRepositoryMock implements LocationRepository {
  final List<Location> _locations = [
    // UK Cities
    Location(name: 'London', country: Country.uk),
    Location(name: 'Manchester', country: Country.uk),
    Location(name: 'Birmingham', country: Country.uk),
    Location(name: 'Edinburgh', country: Country.uk),
    Location(name: 'Bristol', country: Country.uk),
    // France Cities
    Location(name: 'Paris', country: Country.france),
    Location(name: 'Lyon', country: Country.france),
    Location(name: 'Marseille', country: Country.france),
    Location(name: 'Bordeaux', country: Country.france),
    Location(name: 'Toulouse', country: Country.france),
    // Spain Cities
    Location(name: 'Madrid', country: Country.spain),
    Location(name: 'Barcelona', country: Country.spain),
    Location(name: 'Seville', country: Country.spain),
    Location(name: 'Valencia', country: Country.spain),
    Location(name: 'Bilbao', country: Country.spain),
  ];

  @override
  List<Location> getAvailableLocations() {
    return List.unmodifiable(_locations);
  }
}