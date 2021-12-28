import 'package:flutter/material.dart';
import 'package:nasa_application/core/services/exporter.dart';

Widget buildImageCard(BuildContext context, Iterable<ResponseModel> model) {
  return model.isEmpty
      ? const Center(
          child: Text("Ooops No Item Here."),
        )
      : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: model.length,
          itemBuilder: (context, index) {
            ResponseModel item = model.elementAt(index);
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const NasaLoader(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        );
}
