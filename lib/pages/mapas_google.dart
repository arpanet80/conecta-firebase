import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapasGoogle extends StatefulWidget {
  final LatLng fromPoint = LatLng(-19.585434, -65.743032);
  final LatLng toPoint = LatLng(-19.580860, -65.762276);

  @override
  _MapasGoogleState createState() => _MapasGoogleState();
}

class _MapasGoogleState extends State<MapasGoogle> {
  //GoogleMapController _mapController?;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas Fante'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition:
            CameraPosition(target: widget.fromPoint, zoom: 16),
        markers: _createMarkers(),
        onMapCreated: _onMapCreated,
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(Marker(
        markerId: MarkerId('fromPoint'),
        position: widget.fromPoint,
        infoWindow: InfoWindow(title: 'Origen')));
    tmp.add(Marker(
        markerId: MarkerId('toPoint'),
        position: widget.toPoint,
        infoWindow: InfoWindow(title: 'Destino')));
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    //_mapController = controller;
    _centerView();
  }

  _centerView() async {}
}
