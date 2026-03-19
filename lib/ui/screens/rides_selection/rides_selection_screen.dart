import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/viewmodel/ride_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late RidesSelectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RidesSelectionViewModel(
      ridePreferenceState: context.read<RidePreferenceState>(),
      rideRepository: context.read<RideRepository>(),
    );
  }

  void _onBackRequested() {
    Navigator.pop(context);
  }

  void _onFilterPressed() {
    // TODO
  }

  Future<void> _onPreferenceChangeRequested() async {
    final newPreference = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: _viewModel.selectedRidePreference),
      ),
    );
    if (newPreference != null) {
      _viewModel.selectRidePreference(newPreference);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RideSelectionContent(
      viewModel: _viewModel,
      onBackRequested: _onBackRequested,
      onFilterPressed: _onFilterPressed,
      onPreferenceChangeRequested: _onPreferenceChangeRequested,
    );
  }
}
