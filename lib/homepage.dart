import 'package:flutter/material.dart';
import 'package:flutter_testing_talk/api_service.dart';
import 'package:flutter_testing_talk/gifscore.dart';
import 'package:flutter_testing_talk/model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('👏Gif👏Review👏'),
      ),
      body: FutureBuilder<List<Gif>>(
        future: api.getGifs(),
        builder: (context, snap) {
          if (snap.hasData) {
            final gifs = snap.data;
            return ListView.builder(
              itemCount: gifs?.length ?? 0,
              itemBuilder: (context, position) {
                return GifScore(gifs[position]);
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
