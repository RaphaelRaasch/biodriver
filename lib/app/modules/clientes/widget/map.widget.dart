import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class MapWidget {
  final lat;
  final lng;
  final String text;
  final String desc;

  const MapWidget({
    @required this.lat,
    @required this.lng,
    @required this.text,
    @required this.desc,
  });

  openMapsSheet(context) async {
    try {
      final title = text;
      final description = desc;
      final coords = Coords(lat, lng);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
