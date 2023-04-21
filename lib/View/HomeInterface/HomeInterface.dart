import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeInterface extends StatefulWidget {
  const HomeInterface({Key? key}) : super(key: key);

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  bool openWishCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Wish Card',
            style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Color(0xFF87CEEB),
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
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
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
                ),
              ),
            ),
          ) : GestureDetector(
            onTap: () {
              setState(() {
                openWishCard = true;
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/love2.png'),
            ),
          )
        ],
      ),
    );
  }
}
