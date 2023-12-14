import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 자동 정렬 단축키 windows -> (ctrl + alt + L) mac os -> (cmd + option + L)
class _MyHomePageState extends State<MyHomePage> {
  // 재생 목록
  List<String> lstTitle = [
    'christmas holidays',
    'jingle bells orchestra',
    'new year ambient',
    'joyful jingle',
    'o holy night',
    'we wish you a merry-christmas',
    'winter forest happy merry christmas',
    'all i want for christmas',
    'last christmas',
  ];

  // 뮤직 플레이어 클래스 인스턴스 생성
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  // 현재 플레이 중인 음악 index
  int currentPlayIndex = -1;

  // widget screen 이 실행될 때 딱 한번 호출되는 함수
  @override
  void initState() {
    // 음원 연동을 제목과 연동
    assetsAudioPlayer.open(
      Playlist(
        audios: [
          Audio("assets/audios/christmas-holidays_medium-172984.mp3"),
          Audio("assets/audios/jingle-bells-orchestra_56sec-172985.mp3"),
          Audio("assets/audios/joyful-jingle-173919.mp3"),
          Audio("assets/audios/new-year-ambient-background-174068.mp3"),
          Audio("assets/audios/o-holy-night-172276.mp3"),
          Audio("assets/audios/we-wish-you-a-merry-christmas_60sec-174155.mp3"),
          Audio(
              "assets/audios/winter-forest-happy-merry-christmas-music-173777.mp3"),
          Audio("assets/audios/all-I-want-for-christmas.mp3"),
          Audio("assets/audios/last-christmas.mp3"),
        ],
      ),
      loopMode: LoopMode.playlist,
      autoStart: false,
      showNotification: true,
      playInBackground: PlayInBackground.enabled,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단바
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text(
          'Christmas Player',
          style: GoogleFonts.mountainsOfChristmas(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16,),
            child: InkWell(
              child: Icon(
                Icons.stop_circle_outlined,
                size: 24,
                color: Colors.white,
              ),
              onTap: () {
                assetsAudioPlayer.stop();
              },
            ),
          )
        ],
      ),
      // 몸체
      body: Stack(
        children: [
          // 배경 사진
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              'https://th.bing.com/th/id/OIG.Iv1zxIj.rGa_6B2o8WgD?w=1024&h=1024&rs=1&pid=ImgDetMain',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Lottie.network(
                'https://lottie.host/49a0b926-7e89-41bd-92dc-37043f2f651d/HvXc6QDaxl.json',
                fit: BoxFit.cover),
          ),
          // 음원 재생 리스트 뷰 UI
          ListView.builder(
            itemCount: lstTitle.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white.withOpacity(0.3),
                child: ListTile(
                  onTap: () {
                    // 리스트 아이템이 클릭 되었을 때 해당 index에 맞는 음원이 재생된다 !
                    assetsAudioPlayer.playlistPlayAtIndex(index);
                    // 클릭 index update
                    setState(() {
                      // 위젯 상태 업데이트
                      currentPlayIndex = index;
                    });
                  },
                  title: getTitle(index),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget getTitle(int index) {
    if (index == currentPlayIndex) {
      // 현재 클릭한 index (재생 중인 음원 위치)와 일치 될 경우
      return Text(
        lstTitle[index],
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        lstTitle[index],
        style: TextStyle(
          color: Colors.black,
        ),
      );
    }
  }


}
