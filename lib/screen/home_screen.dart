import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourly_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/regions.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 서울
  String region = regions[0];

  Future<Map<ItemCode, List<StatModel>>> fetchData() async {
    Map<ItemCode, List<StatModel>> stats = {};

    // for문으로 모든 데이터에 ItemCode를 statModels에 하나씩 넣어줌
    for (ItemCode itemCode in ItemCode.values) {
      final statModels = await StatRepository.fetchData(itemCode: itemCode);

      stats.addAll({
        itemCode: statModels,
      });
    }
    return stats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        selectedRegion: region,
        onRegionTap: (String region) {
          setState(() {
            this.region = region;
          });
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: primaryColor,
      body: FutureBuilder<Map<ItemCode, List<StatModel>>>(
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

          Map<ItemCode, List<StatModel>> stats = snapshot.data!;
          // 처음 리스트의 데이터를 가져옴 (앱바에 보여줄 내용)
          StatModel pm10RecentStat = stats[ItemCode.PM10]![0];

          // 1-5, 6-10, 11-15
          final status = DataUtils.getStatusFromItemCodeAndValue(
            value: pm10RecentStat.seoul,
            itemCode: ItemCode.PM10,
          );

          return CustomScrollView(
            slivers: [
              MainAppBar(
                region: region,
                stat: pm10RecentStat,
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
