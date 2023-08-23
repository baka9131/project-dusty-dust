import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../const/colors.dart';
import 'name_stat.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        color: lightColor,
        child: LayoutBuilder(
          builder: (context, Constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '종류별 통계',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  // 스크롤 가능한 위젯은 Column안에서 사용할때는 반드시 Expaned를 해줘야함 -> 안하면 오류 발생
                  child: ListView(
                    scrollDirection: Axis.horizontal, // 스크롤 가로 모드
                    physics: PageScrollPhysics(), // 스크롤을 할때 페이지 단위로 넘어가는 액션
                    children: List.generate(
                      20,
                      (index) => MainStat(
                        width: Constraints.maxWidth / 3,
                        category: '미세먼지',
                        imgPath: 'asset/img/best.png',
                        level: '최고',
                        stat: '0㎍/㎥',
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
