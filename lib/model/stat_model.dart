// ignore_for_file: constant_identifier_names

enum ItemCode {
  // 미세먼지
  PM10,
  // 초미세먼지
  PM25,
  // 이산화질소
  NO2,
  // 오존
  O3,
  // 일산화탄소
  CO,
  // 이황산가스
  SO2,
}

class StatModel {
  final double daegu;
  final double chungnam;
  final double incheon;
  final double daejeon;
  final double gyeongbuk;
  final double sejong;
  final double gwangju;
  final double jeonbuk;
  final double gangwon;
  final double ulsan;
  final double jeonnam;
  final double seoul;
  final double busan;
  final double jeju;
  final double chungbuk;
  final double gyeongnam;
  final DateTime dataTime;
  final ItemCode itemCode;
  final double gyeonggi;

  // JSON 형태에서부터 데이터를 받아온다.
  StatModel.fromJson({required Map<String, dynamic> json}):
    // JSON 형태로 값을 받으면 전부 "String" 형태로 들어온다.
    // 그래서 값을 받은 후 알맞는 형태의 데이터 형태로 변환해 주자
    daegu = double.parse(json['daegu'] ?? '0'),
    chungnam = double.parse(json['chungnam'] ?? '0'),
    incheon = double.parse(json['incheon'] ?? '0'),
    daejeon = double.parse(json['daejeon'] ?? '0'),
    gyeongbuk = double.parse(json['gyeongbuk'] ?? '0'),
    sejong = double.parse(json['sejong'] ?? '0'),
    gwangju = double.parse(json['gwangju'] ?? '0'),
    jeonbuk = double.parse(json['jeonbuk'] ?? '0'),
    gangwon = double.parse(json['gangwon'] ?? '0'),
    ulsan = double.parse(json['ulsan'] ?? '0'),
    jeonnam = double.parse(json['jeonnam'] ?? '0'),
    seoul = double.parse(json['seoul'] ?? '0'),
    busan = double.parse(json['busan'] ?? '0'),
    jeju = double.parse(json['jeju'] ?? '0'),
    chungbuk = double.parse(json['chungbuk'] ?? '0'),
    gyeongnam = double.parse(json['gyeongnam'] ?? '0'),
    gyeonggi = double.parse(json['gyeonggi'] ?? '0'),
    dataTime = DateTime.parse(json['dataTime'] ?? '0'),
    itemCode = parseItemCode(json['itemCode'] ?? '0');

    static ItemCode parseItemCode(String raw){
      if(raw == 'PM2.5'){
        return ItemCode.PM25;
      }

      // ItemCode의 값들 중 raw의 값이랑 같을 경우 그 값을 가져옴
      return ItemCode.values.firstWhere((element) => element.name == raw);

      // ItemCode.NO2.name;
      // ItemCode.NO2.toString();
      // 두개의 차이점은 1번은 'NO2' 로 나오고 2번은 'ItemCode.NO2' 로 출력된다. 2번으로 했을때는 따로 split를 해야함
    }
}
