import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';

   HomePage({Key? key}) : super(key: key);
  final markers = <Marker>[
    Marker(
      width: 80,
      height: 80,
      point: LatLng(51.5, -0.09),
      builder: (ctx) => const FlutterLogo(
        textColor: Colors.blue,
        key: ObjectKey(Colors.blue),
      ),
    ),
    Marker(
      width: 80,
      height: 80,
      point: LatLng(53.3498, -6.2603),
      builder: (ctx) => const FlutterLogo(
        textColor: Colors.green,
        key: ObjectKey(Colors.green),
      ),
    ),
    Marker(
      width: 80,
      height: 80,
      point: LatLng(48.8566, 2.3522),
      builder: (ctx) => const FlutterLogo(
        textColor: Colors.purple,
        key: ObjectKey(Colors.purple),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: LatLng(51.5, -0.09),
        builder: (ctx) => const FlutterLogo(
          textColor: Colors.blue,
          key: ObjectKey(Colors.blue),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => const FlutterLogo(
          textColor: Colors.green,
          key: ObjectKey(Colors.green),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(48.8566, 2.3522),
        builder: (ctx) => const FlutterLogo(
          textColor: Colors.purple,
          key: ObjectKey(Colors.purple),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text('This is a map that is showing (51.5, -0.9).'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 5,
                ),
                nonRotatedChildren: [
                  AttributionWidget.defaultWidget(
                    source: 'OpenStreetMap contributors',
                    onSourceTapped: () {},
                  ),
                ],
                children: [

                 // MarkerLayer(markers: markers),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}