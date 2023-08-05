import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/HomeModel/Quotes.dart';

class HomeInterface extends StatefulWidget {
  const HomeInterface({Key? key}) : super(key: key);

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {

  // Initialize current quote in day
  late String currentQuote = "";

  @override
  void initState() {
    super.initState();
    getQuoteOfTheDay();
  }

  // Refresh quote every single day
  Future<void> getQuoteOfTheDay() async {
    final pref = await SharedPreferences.getInstance();

    final lastUpdatedDate = pref.getString("lastUpdatedDay");
    final currentDate = DateTime.now().toString().substring(0, 10);

    if (lastUpdatedDate == currentDate) {
      setState(() {
        currentQuote = pref.getString("quote") ?? "No quote found";
      });
    }
    else {
      /*final newQuote = Quotes.getQuote();
      await pref.setString("quote", newQuote);
      await pref.setString("lastUpdatedDay", currentDate);
      setState(() {
        currentQuote = newQuote;
      });
       */

      final lastUpdatedQuoteId = pref.getString("id");
      final newQuote = Quotes.getQuote();

      // Compare the 'id' of the new quote with the 'id' of the last updated quote
      if (newQuote != lastUpdatedQuoteId) {
        await pref.setString("id", newQuote);
        await pref.setString("quote", newQuote);
        await pref.setString("lastUpdatedDay", currentDate);

        setState(() {
          currentQuote = newQuote;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF87CEEB),
        title: const Text("Love Quote", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: "❝", style: TextStyle(fontSize: 22, color: Colors.grey.shade600)),
                      TextSpan(text: currentQuote,
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = const LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent]).createShader(const Rect.fromLTRB(0, 0, 200, 70))),
                      ),
                      TextSpan(text: "❞", style: TextStyle(fontSize: 22, color: Colors.grey.shade600))
                    ]
                ), textAlign: TextAlign.center),
                const SizedBox(height: 30),
                Text("- Hazmi Hazim -",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold, color: Colors.grey.shade400),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
      ),
    );
  }
}
