// screens/location_detail.location_detail.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'package:flutter_application_1/screens/location_detail/text_section.dart';
import '../../models/location.dart';

class LocationDetail extends StatelessWidget {
  final int _locationId;

  LocationDetail(this._locationId);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationId);

    return Scaffold(
        appBar: AppBar(
          title: Text(location.name),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageBanner(path: location.imagePath),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                  child: LocationTile(location: location),
                )
              ]..addAll(textSections(location))),
        ));
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
