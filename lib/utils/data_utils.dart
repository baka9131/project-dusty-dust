import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/status_model.dart';
import 'package:intl/intl.dart';
import '../model/stat_model.dart';

class DataUtils {
  static String getTimeFromDateTime() {
    return DateFormat('yy/MM/dd HH:mm').format(DateTime.now());
  }

  static String getUnitFromItemCode({required ItemCode itemCode}) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '㎍/㎥';

      case ItemCode.PM25:
        return '㎍/㎥';

      default:
        return 'ppm';
    }
  }

  static String itemCodeKrString({required ItemCode itemCode}) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '미세먼지';
      case ItemCode.PM25:
        return '초미세먼지';
      case ItemCode.NO2:
        return '이산화질소';
      case ItemCode.O3:
        return '오존';
      case ItemCode.CO:
        return '일산화탄소';
      case ItemCode.SO2:
        return '아황산가스';
    }
  }

  // ItemCode(PM10,PM25..), value(json datas) 데이터를 2개 받아서 ItemCode로 분류 후 -> 0 - 151 미세먼지 농도를 .where() 통해 최고/좋음/나쁨로 분류
  static StatusModel getStatusFromItemCodeAndValue(
      {required double value, required ItemCode itemCode}) {
    return statusLevel.where(
      (status) {
        if (itemCode == ItemCode.PM10) {
          return status.minFineDust < value;
        } else if (itemCode == ItemCode.PM25) {
          return status.minUltraFineDust < value;
        } else if (itemCode == ItemCode.CO) {
          return status.minCO < value;
        } else if (itemCode == ItemCode.O3) {
          return status.minO3 < value;
        } else if (itemCode == ItemCode.NO2) {
          return status.minNO2 < value;
        } else if (itemCode == ItemCode.SO2) {
          return status.minSO2 < value;
        } else {
          throw Exception('알수없는 ItemCode입니다.');
        }
      },
    ).last;
  }
}
