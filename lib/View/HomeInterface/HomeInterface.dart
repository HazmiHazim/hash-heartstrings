import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeInterface extends StatefulWidget {
  const HomeInterface({Key? key}) : super(key: key);

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  bool openWishCard = false;
  late VideoPlayerController controller;
  bool textIsFinish = false;

  /*@override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/video/Couple-Video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }*/

  @override
  Widget build(BuildContext context) {
    const beautifulColor = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Wish Card',
            style: TextStyle(color: Colors.white)
        ),
        backgroundColor: const Color(0xFF87CEEB),
      ),
      body: Stack(
        children: [
          openWishCard ? Center(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                            'Selamat Hari Jadi & Hari Raya Sayangku. Saya mintak maaf sangat-sangat buat awak sedih. '
                                'Saya nak awak tahu saya memang sayang kat awak seorang sahaja. '
                                'Saya tak bercakap 1 minggu ini sebab saya marah dekat awak. Saya tahu saya ego tinggi. '
                                'Saya ingin memohon maaf atas kejelesan saya sehingga membuatkan awak benci saya. '
                                'Saya juga mintak maaf sebab lambat wish hari jadi awak. Terimalah hadiah saya yang tak seberapa ini. '
                                'Saya buat app ni memang lama tapi untuk meunjukkan betapa saya sangat committed buat app ni untuk sayang saya. '
                                'Saya sebenarnya rindu juga bila kita bergaduh tapi saya yang ego. '
                                'Saya harap awak dapat terima balik saya dan kita hidup balik seperti biasa. '
                                '\n\nSekali Lagi Saya Ucapkan:\nSelamat Hari Raya Aidilfitri Maaf Zahir Dan Batin',
                            textAlign: TextAlign.justify,
                        )
                      ],
                      isRepeatingAnimation: false,
                      onFinished: (){
                        setState(() {
                          textIsFinish = true;
                        });
                      },
                    ),
                  ),
                  if (textIsFinish)
                    FloatingActionButton(
                      child: const Icon(Icons.play_circle_outline_sharp),
                      onPressed: (){
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return WillPopScope(
                                onWillPop: () async {
                                  controller.pause();
                                  return true;
                                },
                                child: AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          height: 200,
                                          child: controller.value.isInitialized ? VideoPlayer(controller) : Container(),
                                        ),
                                        const SizedBox(height: 10),
                                        FloatingActionButton(
                                          child: const Icon(Icons.play_circle_outline_sharp),
                                          onPressed: () {
                                            setState(() {
                                              controller.value.isPlaying ? controller.pause() : controller.play();
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          );
                        });
                      },
                    )
                ],
              ),
            ),
          ) : GestureDetector(
            onTap: () {
              setState(() {
                openWishCard = true;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText('CLICK ME !!!', textStyle: colorizeTextStyle, colors: beautifulColor)
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/love2.png'),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText('CLICK ME !!!', textStyle: colorizeTextStyle, colors: beautifulColor)
                  ],
                  isRepeatingAnimation: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
