import 'package:nasa_application/core/services/exporter.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBuilder: (context, i) =>
            Gallery(data: Provider.of<MainProvider>(context).roverList[i]),
        tabBar: CupertinoTabBar(
          items: roverList
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.name))
              .toList(),
        ),
      ),
    );
  }
}
