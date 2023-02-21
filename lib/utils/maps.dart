import "package:flutter_osm_plugin/flutter_osm_plugin.dart";
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Maps extends StatelessWidget {
  Maps({super.key});

  MapController controller1 = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(
      latitude: 13.611915087710317,
      longitude: 100.83781993657047,
    ),
    //areaLimit: BoundingBox( east: 10.4922941, north: 47.8084648, south: 45.817995, west: 5.9559113,),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            flex: 1,
            child: OSMFlutter(
              controller: controller1,
              trackMyPosition: false,
              initZoom: 7,
              minZoomLevel: 7,
              maxZoomLevel: 19,
              stepZoom: 1.0,
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_on_outlined,
                    size: 99,
                    color: Colors.black,
                  ),
                ),
              ),
              roadConfiguration: RoadConfiguration(
                startIcon: const MarkerIcon(
                  icon: Icon(
                    Icons.person,
                    size: 64,
                    color: Colors.red,
                  ),
                ),
                roadColor: Colors.yellowAccent,
              ),
              markerOption: MarkerOption(
                  defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 89,
                ),
              )),
            ),
          ),
          Positioned(
            bottom: 7,
            right: 7,
            child: FloatingActionButton(
              onPressed: () async {
                await controller1.setZoom(stepZoom: -1);
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.remove, color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 7,
            child: FloatingActionButton(
              onPressed: () async {
                await controller1.setZoom(stepZoom: 1);
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 140,
            right: 7,
            child: FloatingActionButton(
              onPressed: () async {
                await controller1.currentLocation();
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.my_location,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 210,
            right: 7,
            child: FloatingActionButton(
              onPressed: () async {
                //RoadInfo roadInfo = 
                await controller1.changeLocation(GeoPoint(latitude: 13.611915087710317, longitude: 100.83781993657047));

                await controller1.changeLocation(GeoPoint(latitude: 12.9609, longitude: 100.8847));

                await controller1.drawRoad(
                  GeoPoint(latitude: 13.611915087710317, longitude: 100.83781993657047),
                  GeoPoint(latitude: 12.960931270240254, longitude: 100.88470612177895),
                  roadType: RoadType.car,
                  intersectPoint: [
                    GeoPoint(latitude: 13.6119, longitude: 100.8378),
                    GeoPoint(latitude: 12.9609, longitude: 100.8847)
                  ],
                  roadOption: const RoadOption(
                    roadWidth: 10,
                    roadColor: Colors.blue,
                    showMarkerOfPOI: false,
                    zoomInto: true,
                  ),
                );
                //print("${roadInfo.distance}km");
                //print("${roadInfo.duration}sec");
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.directions_car_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              //controller: TextEditingController(text:'data'),
              autofocus: false,
              style: TextStyle(color: Colors.grey[800]),
              onChanged: (String text) {},
              decoration: const InputDecoration(
                labelText: "pick a location...",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  //borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
