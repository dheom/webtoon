import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  //FutureBuilder를 통해 미래의 값이 끝날때 빌드를 진행할수있음 그전에 빌드하면 UI가 데이터 없이 그려짐
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "오늘's 툰",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          //snapshot은 futurebuilder의 결과값을 담고있음
          if (snapshot.hasData) {
            return Text('There is data');
          }
          return const Text("data is loading");
        },
      ),
    );
  }
}
