// This class responsible for your question data and answer
// Put all your question and answer here


class Question {
  static List<Map<String, dynamic>> question = [
    {
      'soalan': '**************?',
      'jawapan': [
        {'pilihanJawapan': 'Answer A', 'score': false},
        {'pilihanJawapan': 'Answer B', 'score': false},
        {'pilihanJawapan': 'Answer C', 'score': true},
        {'pilihanJawapan': 'Answer D', 'score': false},
        {'pilihanJawapan': 'Answer E', 'score': false},
      ],
    },
    {
      'soalan': '**************?',
      'jawapan': [
        {'pilihanJawapan': 'Answer A', 'score': false},
        {'pilihanJawapan': 'Answer B', 'score': false},
        {'pilihanJawapan': 'Answer C', 'score': false},
        {'pilihanJawapan': 'Answer D', 'score': false},
        {'pilihanJawapan': 'Answer E', 'score': true},
      ]
    },
  ];

  static void shuffleQuestions() {
    question.shuffle();
  }
}
