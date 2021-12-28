
import 'package:nasa_application/core/services/exporter.dart';

class LogoutScreenTest extends StatelessWidget {
  const LogoutScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
            child: const Text('Farewell Facebook'),
            onPressed: () {
              AuthService().logOutFromFacebook();
            }),
      ),
    );
  }
}
