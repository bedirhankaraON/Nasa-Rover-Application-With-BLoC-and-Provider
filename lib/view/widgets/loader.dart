import 'package:nasa_application/core/services/exporter.dart';

class NasaLoader extends StatelessWidget {
  const NasaLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator(
      animating: true,
      radius: 20,
    );
  }
}
