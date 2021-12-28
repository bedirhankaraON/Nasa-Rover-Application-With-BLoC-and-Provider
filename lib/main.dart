import 'package:flutter/material.dart';
import 'package:nasa_application/core/services/exporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MainProvider(),
        ),
      ],
      child: FutureBuilder(
          future: AuthService().init(),
          builder: (context, snap) {
            if (snap.hasData && snap.data == true) {
              return CupertinoApp(
                title: 'Nasa Rover',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  DefaultMaterialLocalizations.delegate
                ],
                theme: const CupertinoThemeData(brightness: Brightness.light),
                home: StreamBuilder<AuthState>(
                    stream: AuthService().authStream,
                    builder: (context, snap) {
                      if (snap.data is LoggedIn) {
                        return const GalleryScreen();
                      } else if (snap.data is LoginRequired) {
                        return const LoginScreen();
                      } else {
                        return const CupertinoPageScaffold(
                          child: Center(
                            child: NasaLoader(),
                          ),
                        );
                      }
                    }),
              );
            } else if (snap.hasError) {
              return Text(snap.error.toString());
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          }),
    );
  }
}
