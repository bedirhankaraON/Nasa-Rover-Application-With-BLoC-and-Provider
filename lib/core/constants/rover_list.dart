import 'package:nasa_application/core/services/exporter.dart';

final List<Rover> roverList = [
  Rover(
      name: "Curiosity",
      icon: CupertinoIcons.square,
      cameraList: [
        Camera.FHAZ,
        Camera.RHAZ,
        Camera.MAST,
        Camera.CHEMCAM,
        Camera.MAHLI,
        Camera.MARDI,
        Camera.NAVCAM
      ],
      selectedCamera: Camera.FHAZ),
  Rover(name: "Opportunity", icon: CupertinoIcons.triangle, cameraList: [
    Camera.FHAZ,
    Camera.RHAZ,
    Camera.NAVCAM,
    Camera.PANCAM,
    Camera.MINITES,
  ], selectedCamera: Camera.FHAZ),
  Rover(name: "Spirit", icon: CupertinoIcons.circle, cameraList: [
    Camera.FHAZ,
    Camera.RHAZ,
    Camera.NAVCAM,
    Camera.PANCAM,
    Camera.MINITES,
  ], selectedCamera: Camera.FHAZ)
];
