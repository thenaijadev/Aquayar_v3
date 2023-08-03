import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  // final TextEditingController _textController_1 = TextEditingController();
  // final TextEditingController _textController_2 = TextEditingController();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.5244, 3.3792),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(6.5244, 3.3792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final Set<Marker> _markers = <Marker>{};
  final Set<Polygon> _polygons = <Polygon>{};
  final Set<Polyline> _polylines = <Polyline>{};

  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  final int _polylineIdCounter = 1;

  @override
  void initState() {
    super.initState();
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(markerId: const MarkerId("marker"), position: point));
    });
  }

  void _setPolygon() {
    final String polygonIdVal = "polygon_$_polygonIdCounter";
    _polygonIdCounter++;
    _polygons.add(
      Polygon(
          polygonId: PolygonId(polygonIdVal),
          points: polygonLatLngs,
          strokeWidth: 2,
          fillColor: Colors.transparent),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polyLineIdVal = "polyline_$_polylineIdCounter";
    _polygonIdCounter++;
    _polylines.add(
      Polyline(
        polylineId: PolylineId(polyLineIdVal),
        width: 5,
        color: Colors.blue,
        points: points.map(
          (point) {
            return LatLng(point.latitude, point.longitude);
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         Expanded(
        //           child: TextFormField(
        //             controller: _textController_1,
        //             decoration: const InputDecoration(
        //                 contentPadding: EdgeInsets.all(20),
        //                 hintText: "Start point:"),
        //             onChanged: (value) {},
        //           ),
        //         ),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         Expanded(
        //           child: TextFormField(
        //             controller: _textController_2,
        //             decoration: const InputDecoration(
        //                 contentPadding: EdgeInsets.all(20),
        //                 hintText: "End point:"),
        //             onChanged: (value) {},
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // IconButton(
        //     onPressed: () async {
        //       // final place =
        //     await LocationService().getPlace(_textController_2.text);
        //       // _goToPlace(place!);
        //       var directions = await LocationService().getDirections(
        //           _textController_1.text, _textController_2.text);
        //       print(directions);
        //       _setMarker(LatLng(directions?['start_location']["lat"],
        //           directions?['start_location']["lng"]));
        //       _setMarker(LatLng(directions?['end_location']["lat"],
        //           directions?['end_location']["lng"]));

        //       _goToPlace(
        //           directions?['start_location']["lat"],
        //           directions?['start_location']["lng"],
        //           directions?["bounds_ne"],
        //           directions?["bounds_sw"]);

        //       _setPolyline(directions?["polyline_decoded"]);
        //     },
        //     icon: const Icon(Icons.search)),
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: GoogleMap(
              // polylines: {_kPolyline},
              // polygons: {_kPolygon},
              mapType: MapType.normal,
              markers: _markers,
              polygons: _polygons,
              polylines: _polylines,

              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (point) {
                setState(() {
                  polygonLatLngs.add(point);
                  _setPolygon();
                  print(point);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _goToPlace(double lat, double lng, Map<String, dynamic> boundsNe,
      Map<String, dynamic> boundsSw) async {
    // final double lat = place["geometry"]["location"]["lat"];
    // final double lng = place["geometry"]["location"]["lng"];

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 30),
      ),
    );
    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundsSw["lat"], boundsSw["lng"]),
            northeast: LatLng(boundsNe["lat"], boundsNe["lng"])),
        25));
    _setMarker(LatLng(lat, lng));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
