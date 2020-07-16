import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:setupproject/universal/dev_scaffold.dart';

class SponsorPage extends StatelessWidget {
  static const String routeName = "/sponsor";

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        title: "Sponsors",
        body: ListView(
          children: <Widget>[
            SponsorImage(
                imgUrl:
                    "https://devfest.gdgkolkata.org/assets/img/logos/gd.png"),
            SizedBox(height: 30),
            SponsorImage(
                imgUrl:
                    "https://devfest.gdgkolkata.org/assets/img/jetbrains.png"),
            SizedBox(height: 30),
          ],
        ));
  }
}

class SponsorImage extends StatelessWidget {
  final String imgUrl;

  const SponsorImage({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CachedNetworkImage(
              imageUrl: imgUrl, height: 200, width: 200, fit: BoxFit.contain)),
    );
  }
}
