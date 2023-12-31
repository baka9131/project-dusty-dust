import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';
import '../const/regions.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final OnRegionTap onRegionTap;
  final String selectedRegion;

  const MainDrawer({
    super.key,
    required this.onRegionTap,
    required this.selectedRegion,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          DrawerHeader(
            // 타이틀 부분
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          ...regions.map(
            // casecade 문법으로 리스트를 하나씩 Widget형태로 반환해줌
            (e) => ListTile(
              tileColor: Colors.white,
              selectedTileColor: lightColor, // 선택이 된 상태에서 배경색
              selectedColor: Colors.black, // 선택이 된 상태에서의 글자 색깔
              selected: e == selectedRegion, // selected 를 사용할 것인지 여부
              onTap: () {
                onRegionTap(e);
              },
              title: Text(e),
            ),
          ),
        ],
      ),
    );
  }
}
