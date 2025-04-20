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
        //많은 양의 데이터를 보여줄때는 column,row를 사용하지않고 ListView.builder를 사용해야함
        future: webtoons,
        builder: (context, snapshot) {
          //snapshot은 futurebuilder의 결과값을 담고있음
          if (snapshot.hasData) {
            return ListView.separated(
              //ListView.separated는 ListView.builder와 비슷하지만 아이템사이에 구분선(위젯)을 넣을수있음
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //한번에 로딩하지않고 필요한 만큼만 로딩함
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
            );
          }
          return Center(child: CircularProgressIndicator()); //로딩중일때 보여줄 위젯
        },
      ),
    );
  }
}
