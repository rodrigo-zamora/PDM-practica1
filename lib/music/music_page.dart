// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, prefer_const_constructors, unused_local_variable, unnecessary_import, prefer_const_literals_to_create_immutables, sort_child_properties_last, depend_on_referenced_packages, must_be_immutable, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bloc/music_bloc.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la canción'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildMusicPage(),
        ],
      ),
    );
  }

  BlocConsumer<MusicBloc, MusicState> _buildMusicPage() {
    return BlocConsumer<MusicBloc, MusicState>(
      listener: (context, MusicState state) {
        if (state is MusicLoadedState) {
          print(state.props[0]);
        }
      },
      builder: (context, MusicState state) {
        return Column(
          children: [
            Image(
              image: NetworkImage(
                state.musicInfo['artwork'],
              ),
              width: double.infinity,
            ),
            Text(
              state.musicInfo['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              state.musicInfo['artist'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              state.musicInfo['album'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              state.musicInfo['release_date'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Abrir con:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.spotify,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.podcast,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launch(state.musicInfo['apple_music']);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
