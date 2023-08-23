# 미세먼지 앱 개발 노트

### 2023/08/20 (일) - SliverAppBar

---

<center><h3>Files List</h3></center>

<p align="center"><img width="399" alt="image" src="https://github.com/baka9131/project-dusty-dust/assets/93738662/c2a81efc-d7ba-4d8a-890b-9259c2285d3b"></p>

---


<p align="center">
<img width="318" alt="image" src="https://github.com/baka9131/project-dusty-dust/assets/93738662/55ce0dd2-025a-4719-a78c-54e2470b5e15">
</p>

+ 상하 위 아래로 스크롤이 가능한 AppBar를 구현



```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
        ],
      ),
    );
  }
}
```

* CustomScrollView 사용하여 slivers를 통해 위아래 스크롤이 가능하고 커스텀이 가능하도록 구현



```dart
import 'package:intl/intl.dart';

final String formatDate = DateFormat('yy/MM/dd HH:mm').format(
      // 날짜의 데이터 포맷을 지정
      DateTime.now(),
    );
```

+ format()을 통해서 날짜를 원하는 부분까지만 지정하여 출력하게 설정