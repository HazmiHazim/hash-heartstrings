class Question {
  static List<Map<String, dynamic>> question = [
    {
      'soalan': 'Hazim Suka Makan Apa?',
      'jawapan': [
        {'pilihanJawapan': 'Nasi Kandar Kuah Campuq', 'score': false},
        {'pilihanJawapan': 'Nasi Goreng U.S.A', 'score': false},
        {'pilihanJawapan': 'Nasi Ayam', 'score': true},
        {'pilihanJawapan': 'Nasi Goreng Lamb Chop', 'score': false},
        {'pilihanJawapan': 'Nasi Putih Ayam Buttermilk', 'score': false},
      ],
    },
    {
      'soalan': 'Hazim Suka Minum Apa?',
      'jawapan': [
        {'pilihanJawapan': 'Milo Ais Mamak', 'score': false},
        {'pilihanJawapan': 'Teh Ais Sedap', 'score': false},
        {'pilihanJawapan': 'Neslo Ais', 'score': false},
        {'pilihanJawapan': 'Starbucks', 'score': false},
        {'pilihanJawapan': 'Teh Ais Mamak', 'score': true},
      ]
    },
    {
      'soalan': 'Bilakah Tarikh Hari Lahir Hazim?',
      'jawapan': [
        {'pilihanJawapan': '7 July', 'score': false},
        {'pilihanJawapan': '25 September', 'score': true},
        {'pilihanJawapan': '12 January', 'score': false},
        {'pilihanJawapan': '30 February', 'score': false},
        {'pilihanJawapan': '16 May', 'score': false},
      ]
    },
    {
      'soalan': 'Apakah Warna Kegemaran Hazim?',
      'jawapan': [
        {'pilihanJawapan': 'Merah', 'score': true},
        {'pilihanJawapan': 'Biru', 'score': false},
        {'pilihanJawapan': 'Hijau', 'score': false},
        {'pilihanJawapan': 'Kuning', 'score': false},
        {'pilihanJawapan': 'Hitam', 'score': false},
      ]
    },
    {
      'soalan': 'Apakah Nama Iconic Bagi Hazim?',
      'jawapan': [
        {'pilihanJawapan': 'Hazmi Hazim', 'score': false},
        {'pilihanJawapan': 'Kira Ichigo', 'score': false},
        {'pilihanJawapan': 'Saitama', 'score': false},
        {'pilihanJawapan': 'Hazim Netto', 'score': true},
        {'pilihanJawapan': 'Jack Frost', 'score': false},
      ]
    },
    {
      'soalan': 'Apakah Cita-Cita Hazim Ketika Kecil?',
      'jawapan': [
        {'pilihanJawapan': 'Programmer', 'score': false},
        {'pilihanJawapan': 'Angkasawan', 'score': true},
        {'pilihanJawapan': 'Doktor', 'score': false},
        {'pilihanJawapan': 'Perdana Menteri', 'score': false},
        {'pilihanJawapan': 'Super Hero', 'score': false},
      ]
    },
    {
      'soalan': 'Hazim Anak Ke Berapa Dari Berapa Adik Beradik?',
      'jawapan': [
        {'pilihanJawapan': '1 Dari 5 Adik Beradik', 'score': false},
        {'pilihanJawapan': '3 Dari 7 Adik Beradik', 'score': false},
        {'pilihanJawapan': '2 Dari 5 Adik Beradik', 'score': true},
        {'pilihanJawapan': '3 Dari 3 Adik Beradik', 'score': false},
        {'pilihanJawapan': '5 Dari 5 Adik Beradik', 'score': false},
      ]
    },
    {
      'soalan': 'Dimanakah Hazim Tinggal?',
      'jawapan': [
        {'pilihanJawapan': 'Bidor', 'score': false},
        {'pilihanJawapan': 'Tapah Road', 'score': false},
        {'pilihanJawapan': 'Kampar', 'score': false},
        {'pilihanJawapan': 'Tapah', 'score': false},
        {'pilihanJawapan': 'Temoh', 'score': true},
      ]
    },
    {
      'soalan': 'Berapa A Hazim Dapat Ketika SPM?',
      'jawapan': [
        {'pilihanJawapan': '2A', 'score': true},
        {'pilihanJawapan': '6A', 'score': false},
        {'pilihanJawapan': '1A', 'score': false},
        {'pilihanJawapan': '5A', 'score': false},
        {'pilihanJawapan': '3A', 'score': false},
      ]
    },
    {
      'soalan': 'Apakah Yang Membuatkan Hazim Gembira?',
      'jawapan': [
        {'pilihanJawapan': 'Main Dota', 'score': false},
        {'pilihanJawapan': 'Siti Nor Aishah Binti Mohammad Noor', 'score': true},
        {'pilihanJawapan': 'Makan', 'score': false},
        {'pilihanJawapan': 'Tidur', 'score': false},
        {'pilihanJawapan': 'Berak', 'score': false},
      ]
    },
  ];

  static void shuffleQuestions() {
    question.shuffle();
  }
}