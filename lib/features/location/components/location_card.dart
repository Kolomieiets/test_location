import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  String mapTheme = '';

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString('map_theme/dark_map_theme.json')
        .then((value) {
      mapTheme = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 25.0,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 340,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        child: GoogleMap(
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapTheme);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              Provider.of<LocationScreenProvider>(context).lat,
              Provider.of<LocationScreenProvider>(context).lon,
            ),
            zoom: 14.4746,
          ),
        ),
      ),
    );
  }
}
