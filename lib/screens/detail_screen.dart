import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, tumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.tumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.id,
              child: Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 15,
                      offset: Offset(10, 10),
                    ),
                  ],
                ),
                child: Image.network(
                  widget.tumb,
                  headers: const {'Referer': 'https://comic.naver.com'},
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),

            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          //여러 정보 가져오자
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          //여러 정보 가져오자
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }
                return Text("Loading...");
              },
            ),
            SizedBox(height: 50),
            FutureBuilder(future: episodes,
             builder: (context, snapshot) {
              
             }
            
            )
          ],
        ),
      ),
    );
  }
}
