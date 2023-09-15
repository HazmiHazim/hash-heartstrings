class Question {
  static List<Map<String, dynamic>> question = [
    {
      'soalan': 'Put you question here?',
      'jawapan': [
        {'pilihanJawapan': 'A', 'score': false},
        {'pilihanJawapan': 'B', 'score': false},
        {'pilihanJawapan': 'C', 'score': true},
        {'pilihanJawapan': 'D', 'score': false},
        {'pilihanJawapan': 'E', 'score': false},
      ],
    },
  ];

  static void shuffleQuestions() {
    question.shuffle();
  }
}
