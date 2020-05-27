import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setupproject/config/index.dart';
import 'package:setupproject/universal/image_card.dart';
import 'package:setupproject/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> devFestText(context) => [
        Text(
          Utils.welcomeText,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0),
        Text(
          Utils.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        )
      ];

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://facebook.com/imthepk");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/imthepk");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL("https://linkedin.com/in/imthepk");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL("https://youtube.com/mtechviral");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.meetup),
              onPressed: () async {
                await _launchURL("https://meetup.com/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:mtechviral@gmail.com?subject=Support Needed For DevFest App&body={Name: Pawan Kumar},Email: pawan221b@gmail.com}''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ImageCard(
                  img: ConfigBloc().darkModeOn
                      ? Utils.banner_dark
                      : Utils.banner_light),
              SizedBox(height: 20.0),
              ...devFestText(context),
              SizedBox(
                height: 20,
              ),
              socialActions(context),
              SizedBox(
                height: 20,
              ),
              Text(
                Utils.app_version,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
              )
            ],
          )),
    );
  }
}
