import 'package:flutter/foundation.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

/// Global state for ride preferences.
/// Manages the currently selected preference and the preference history.

class RidePreferenceState extends ChangeNotifier {
  static const int maxAllowedSeats = 8;

  final RidePreferenceRepository ridePreferenceRepository;

  RidePreference? _currentRidePreference;
  List<RidePreference> _ridePreferenceHistory = [];

  RidePreferenceState({
    required this.ridePreferenceRepository,
  }) {
    _ridePreferenceHistory = ridePreferenceRepository.getPreferenceHistory();
  }

  RidePreference? get currentRidePreference => _currentRidePreference;

  List<RidePreference> get ridePreferenceHistory =>
      List.unmodifiable(_ridePreferenceHistory);

  void selectRidePreference(RidePreference ridePreference) {
    if (_currentRidePreference == ridePreference) return;

    _currentRidePreference = ridePreference;

    ridePreferenceRepository.addPreferenceToHistory(ridePreference);
    _ridePreferenceHistory =
        ridePreferenceRepository.getPreferenceHistory();

    notifyListeners();
  }
}
