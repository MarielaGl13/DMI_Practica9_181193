import 'package:flutter/material.dart';
import 'package:movieapp_181193/common/HttpHandler.dart';
import 'package:movieapp_181193/model/Media.dart';
import 'package:movieapp_181193/media_list_item.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() =>
      new _MediaListState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMovies();
  }
  
  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  // Define una clase que extiende State y representa el estado interno de MediaList.
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
              return new MediaListItem(_media[index]);
        },
      ),
    );
  }
}