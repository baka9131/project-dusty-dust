import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/stat_model.dart';
import '../model/status_model.dart';

class MainAppBar extends StatelessWidget {
  // 가져온 stat 모델로 단계를 나누는 모델
  final StatusModel status;
  // 실제 데이터를 가져오는 모델
  final StatModel stat;

  const MainAppBar({
    super.key,
    required this.status,
    required this.stat,
  });

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
      backgroundColor: status.primaryColor,
      expandedHeight: 500, // 높이 최대 사이즈 지정
      flexibleSpace: FlexibleSpaceBar(
        // AppBar의 상하 스크롤 (FlexibleSpaceBar)
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight), // 앱바의 시스템상 높이값을 가져옴
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
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 20.0),
                Text(
                  status.label,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  status.comment,
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
