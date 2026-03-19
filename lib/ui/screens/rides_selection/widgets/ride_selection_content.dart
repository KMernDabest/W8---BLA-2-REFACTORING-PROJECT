import 'package:blabla/ui/screens/rides_selection/viewmodel/ride_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class RideSelectionContent extends StatelessWidget {
  final RidesSelectionViewModel viewModel;
  final VoidCallback onBackRequested;
  final VoidCallback onFilterPressed;
  final Future<void> Function() onPreferenceChangeRequested;

  const RideSelectionContent({
    super.key,
    required this.viewModel,
    required this.onBackRequested,
    required this.onFilterPressed,
    required this.onPreferenceChangeRequested,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final matchingRides = viewModel.matchingRides;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
            child: Column(
              children: [
                RideSelectionHeader(
                  ridePreference: viewModel.selectedRidePreference,
                  onBackPressed: onBackRequested,
                  onFilterPressed: onFilterPressed,
                  onPreferencePressed: () => onPreferenceChangeRequested(),
                ),

                SizedBox(height: 100),

                Expanded(
                  child: ListView.builder(
                    itemCount: matchingRides.length,
                    itemBuilder: (ctx, index) => RideSelectionTile(
                      ride: matchingRides[index],
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
