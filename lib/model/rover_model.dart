import 'package:nasa_application/core/services/exporter.dart';

class Rover {
  final String name;
  final IconData icon;
  final List<Camera> cameraList;
  Camera selectedCamera;
  Rover({
    required this.name,
    required this.icon,
    required this.cameraList,
    required this.selectedCamera,
  });
}
