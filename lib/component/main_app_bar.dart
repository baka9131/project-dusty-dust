import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../const/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );
    final String formatDate = DateFormat('yy/MM/dd HH:mm').format(
      // 날짜의 데이터 포맷을 지정
      DateTime.now(),
    );
    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 500, // 높이 최대 사이즈 지정
      flexibleSpace: FlexibleSpaceBar(
        // AppBar의 상하 스크롤 (FlexibleSpaceBar)
        background: SafeArea(
          child: Column(
            children: [
              Text(
                '서울',
                style: ts.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                formatDate,
                style: ts.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset(
                'asset/img/mediocre.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 20.0),
              Text(
                '보통',
                style: ts.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '나쁘지 않네요!',
                style: ts.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
