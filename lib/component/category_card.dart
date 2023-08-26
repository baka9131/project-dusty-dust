import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/main_card.dart';
import 'package:flutter/material.dart';
import 'name_stat.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(title: '종류별 통계'),
                Expanded(
                  // height를 지정해 주지 않으면 높이를 무한으로 가져감
                  child: ListView(
                    scrollDirection: Axis.horizontal, // 스크롤 가로 모드
                    physics: PageScrollPhysics(), // 스크롤을 할때 페이지 단위로 넘어가는 액션
                    children: List.generate(
                      20,
                      (index) => MainStat(
                        width: constraints.maxWidth / 3,
                        category: '미세먼지',
                        imgPath: 'asset/img/best.png',
                        level: '최고',
                        stat: '0㎍/㎥',
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
