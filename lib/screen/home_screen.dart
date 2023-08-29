import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourly_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<StatModel>> fetchData() async {
    final statModels = await StatRepository.fetchData();
    return statModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: primaryColor,
      body: FutureBuilder<List<StatModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          // 데이터에 오류가 있을 경우 메세지 출력
          if (snapshot.hasError) {
            return Center(child: Text('에러가 있습니다.'));
          }
          // 데이터가 없을 경우 로딩 상태
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<StatModel> stats = snapshot.data!;
          // 처음 리스트의 데이터를 가져옴 (앱바에 보여줄 내용)
          StatModel recentStat = stats[0];

          // 1-5, 6-10, 11-15
          final status = statusLevel.where((e) => e.minFineDust < recentStat.seoul).last;

          return CustomScrollView(
            slivers: [
              MainAppBar(
                stat: recentStat,
                status: status,
              ),
              SliverToBoxAdapter(
                // Sliver에 일반 위젯을 넣게 해줌
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryCard(),
                    const SizedBox(height: 16.0),
                    HourlyCard(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
