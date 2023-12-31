import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import '../model/stat_model.dart';
import '../model/status_model.dart';

class MainAppBar extends StatelessWidget {
  // 지역
  final String region;
  // 가져온 stat 모델로 단계를 나누는 모델
  final StatusModel status;
  // 실제 데이터를 가져오는 모델
  final StatModel stat;

  const MainAppBar({
    super.key,
    required this.status,
    required this.stat,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
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
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DataUtils.getTimeFromDateTime(),
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
