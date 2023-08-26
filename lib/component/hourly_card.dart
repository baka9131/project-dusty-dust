import 'package:flutter/material.dart';
import 'card_title.dart';
import 'main_card.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(title: '시간별 미세먼지'),
          Column(
            children: List.generate(
              // 총 24시간을 반환
              24,
              (index) {
                final now = DateTime.now();
                final hour = now.hour;
                int currentHour = hour - index;

                // 시간 계산
                if (hour - index < 0) {
                  currentHour += 24;
                }

                // 반환 값
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      // Expanded를 전부 주어 비율을 1:1:1로 하여 사이즈를 똑같이 만듬
                      // -> mainAxisAlignment를 하게 되면 비율이 각자 달라서 비뚤비뚤 해짐
                      Expanded(child: Text('$currentHour시')),
                      Expanded(
                        child: Image.asset(
                          'asset/img/good.png',
                          height: 20.0,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        '좋음',
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
