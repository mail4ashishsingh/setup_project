import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setupproject/agenda/agenda_page.dart';
import 'package:setupproject/config/index.dart';
import 'package:setupproject/faq/faq_page.dart';
import 'package:setupproject/speakers/speaker_page.dart';
import 'package:setupproject/sponsors/sponsor_page.dart';
import 'package:setupproject/team/team_page.dart';
import 'package:setupproject/universal/image_card.dart';
import 'package:setupproject/utils/tools.dart';
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

  Widget newAction(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
              icon: Icons.schedule,
              color: Colors.red,
              title: Utils.agenda_text,
              onPressed: () =>
                  Navigator.pushNamed(context, AgendaPage.routeName)),
          ActionCard(
              icon: Icons.person,
              color: Colors.green,
              title: Utils.speakers_text,
              onPressed: () =>
                  Navigator.pushNamed(context, SpeakersPage.routeName)),
          ActionCard(
              icon: Icons.people,
              color: Colors.amber,
              title: Utils.team_text,
              onPressed: () =>
                  Navigator.pushNamed(context, TeamPage.routeName)),
          ActionCard(
              icon: Icons.attach_money,
              color: Colors.purple,
              title: Utils.sponsor_text,
              onPressed: () =>
                  Navigator.pushNamed(context, SponsorPage.routeName)),
          ActionCard(
              icon: Icons.question_answer,
              color: Colors.brown,
              title: Utils.faq_text,
              onPressed: () => Navigator.pushNamed(context, FaqPage.routeName)),
          ActionCard(
              icon: Icons.map,
              color: Colors.blue,
              title: Utils.map_text,
              onPressed: () => Navigator.pushNamed(context, FaqPage.routeName)),
        ],
      );

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
              newAction(context),
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

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
