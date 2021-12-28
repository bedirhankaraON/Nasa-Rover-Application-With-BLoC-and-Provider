import 'package:flutter/material.dart';
import 'package:nasa_application/core/services/exporter.dart';


class Gallery extends StatefulWidget {
  final Rover data;
  const Gallery({Key? key, required this.data}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late FilterBloc mainBloc = FilterBloc(rover: widget.data);
  
  @override
  void initState() {
    startSearching();
    super.initState();
  }

  startSearching() {
    mainBloc.add(AddFilter(widget.data.selectedCamera, 100));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text("Filter"),
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    barrierColor: Colors.white,
                    builder: (c) {
                      return SafeArea(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                    child: const Icon(
                                      Icons.close,
                                      size: 32,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                  itemExtent: 32.0,
                                  onSelectedItemChanged: (index) {
                                    Provider.of<MainProvider>(context,
                                            listen: false)
                                        .setCamera(
                                            widget.data.cameraList[index],
                                            widget.data);
                                  },
                                  children: List.generate(
                                      widget.data.cameraList.length, (index) {
                                    var camera = widget.data.cameraList[index];
                                    return Text(camera.toString());
                                  })),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CupertinoButton.filled(
                                  child: const Text("Done"),
                                  onPressed: () {
                                    startSearching();
                                    Navigator.pop(context);
                                  }),
                            )
                          ],
                        ),
                      );
                    });
              }),
          middle: const Text('Nasa Rover'),
          trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text("Logout"),
              onPressed: () {
                AuthService().logOutFromFacebook();
              }),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Selected Camera : ${widget.data.selectedCamera.toString().split('.').last}",
                        style: h2,
                      ),
                    ],
                  ),
                ),
                _buildGallery(),
              ],
            ),
          ),
        ));
  }

  Widget _buildGallery() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider<FilterBloc>(
        create: (_) => mainBloc,
        child: BlocListener<FilterBloc, FilterState>(
          listener: (context, state) {
            if (state is FilterError) {
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              if (state is FilterLoading) {
                return const NasaLoader();
              } else if (state is FilterResult) {
                // print(state.data);
                return buildImageCard(context, state.data);
              } else if (state is FilterError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text("Unknown Error"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
