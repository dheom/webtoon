import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, tumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.tumb,
    required this.id,
  });
//Hero widget를 사용하면 화면 전환시 애니메이션 효과를 줄 수 있다.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            //화면 라우팅할때 full screen dialog을 사용하면 UX가 좋다.
            builder:
                (context) => DetailScreen(title: title, tumb: tumb, id: id),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag:id,
            //Hero widget을 사용하면 화면 전환시 애니메이션 효과를 줄 수 있다.
            //tag는 고유한 값으로 설정해야 한다.
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
                tumb,
                headers: const {'Referer': 'https://comic.naver.com'},
                //fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
