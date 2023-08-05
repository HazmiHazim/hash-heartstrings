import 'dart:math';

class Quotes {
  static List<Map<String, dynamic>> content = [
    {
      "id": "1",
      "quote": "I’m much more me when I’m with you."
    },
    {
      "id": "2",
      "quote": "It was love at first sight, at last sight, at ever and ever sight."
    },
    {
      "id": "3",
      "quote": "I saw that you were perfect, and so I loved you. Then I saw that you were not perfect, and I loved you even more."
    },
    {
      "id": "4",
      "quote": "Your smile is the sunshine that makes flowers blossom."
    },
    {
      "id": "5",
      "quote": "You are the finest, loveliest, tenderest, and most beautiful person I have ever known and even that is an understatement."
    },
    {
      "id": "6",
      "quote": "I didn’t choose you, my heart did."
    },
    {
      "id": "7",
      "quote": "Every moment spent with you is like a beautiful dream come true."
    },
    {
      "id": "8",
      "quote": "You are the finest, loveliest, tenderest, and most beautiful person I have ever known, and even that is an understatement."
    },
    {
      "id": "9",
      "quote": "I might not be able to express my love in words because you take my breath away."
    },
    {
      "id": "10",
      "quote": "Your beauty, smile, and laugh are what brought us together. Your loving heart is what makes me want to spend my life with you."
    },
    {
      "id": "11",
      "quote": "I loved you yesterday, I love you still, I always have."
    },
    {
      "id": "12",
      "quote": "I feel wonderful because I see the love light in your eyes, and the wonder of it all is that you just don’t realize how much I love you."
    },
    {
      "id": "13",
      "quote": "I love you with the breath, the smiles, and the tears of all my life."
    },
    {
      "id": "14",
      "quote": "You are my perfect match there is no doubt in that because you have proven it beyond expectations. Your kind-hearted spirit will last forever in my memory. I will continue to love you even afterlife. I love you extraordinarily!"
    },
    {
      "id": "15",
      "quote": "You are the queen of my heart. Your wish is my command and always will be."
    },
    {
      "id": "16",
      "quote": "I will love you until the stars go out, and the tides no longer turn."
    },
    {
      "id": "17",
      "quote": "I love you without knowing how, or when, or from where. I love you simply, without problems or pride: I love you in this way because I do not know any other way of loving but this, in which there is no I or you, so intimate that your hand upon my chest is my hand, so intimate that when I fall asleep your eyes close."
    },
    {
      "id": "18",
      "quote": "You need not worry about me, I am already in your heart."
    },
    {
      "id": "19",
      "quote": "My heart sinks every time I smile at you hoping that you will always smile back."
    },
    {
      "id": "20",
      "quote": "I love you with every beat of my heart."
    },
    {
      "id": "21",
      "quote": "I want you for always – days, years, eternities."
    },
    {
      "id": "22",
      "quote": "You’re the closest to heaven that I’ll ever be."
    },
    {
      "id": "23",
      "quote": "From a distance, I love you. When I am close to you, I love you even more. When I am alone at night, I long for you."
    },
    {
      "id": "24",
      "quote": "You’re nothing short of my everything. I wouldn’t have it any other way."
    },
    {
      "id": "25",
      "quote": "Have you ever been in love? Horrible isn't it? It makes you so vulnerable. It opens your chest and it opens up your heart and it means that someone can get inside you and mess you up."
    },
    {
      "id": "26",
      "quote": "You need not worry about me, I am already in your heart."
    },
    {
      "id": "27",
      "quote": "You are my heart, my life, my one and only thought."
    },
    {
      "id": "28",
      "quote": "So many reasons are there to love you. Your cute smile, your sweet laugh, your innocence, and your kind heart makes me love you."
    },
    {
      "id": "29",
      "quote": "There are only two instances when I will ever want to be with you: now and forever."
    },
    {
      "id": "30",
      "quote": "I love you more than words can show, I think about you more than you could."
    },
    {
      "id": "31",
      "quote": "You’re special to every inch of my heart. You love me for me, and I love you for being you."
    },
    {
      "id": "32",
      "quote": "I love you because you join me in my weirdness."
    },
    {
      "id": "33",
      "quote": "Grow old with me. Let’s count each other’s wrinkles as the years pass by. Let’s see who losses all of the teeth and who will need the help of the walking stick first."
    },
    {
      "id": "34",
      "quote": "If I were a mobile phone, you would be my charger. For then, I would be lifeless without you."
    },
    {
      "id": "35",
      "quote": "I love how you make me laugh. I love how you love me back. I love everything about you."
    },
    {
      "id": "36",
      "quote": "My heart is and always will be yours."
    },
    {
      "id": "37",
      "quote": "There is no remedy for love but to love more."
    },
    {
      "id": "38",
      "quote": "Not so long ago I was alone and lost, and then you came along and I was home. Thank you for finding me."
    },
    {
      "id": "39",
      "quote": "You are the sweetest lady of my heart. I adore you more than the most valuable treasure."
    },
    {
      "id": "40",
      "quote": "You are not in any way comparable to the rest of the ladies I have ever seen before. In the midst of ladies, you’re a queen. My darling angel, I love you."
    },
    {
      "id": "41",
      "quote": "Sometimes my eyes get jealous of my heart. Because you always remain close to my heart and far from my eyes."
    },
    {
      "id": "42",
      "quote": "I smiled today for no reason. Then I realized I was thinking of you, and smiled again."
    },
    {
      "id": "43",
      "quote": "Love is that condition in which the happiness of another person is essential to your own."
    },
    {
      "id": "44",
      "quote": "Being in love with you makes every morning worth getting up for."
    },
    {
      "id": "45",
      "quote": "Sometimes I wonder if love is worth fighting for, but then I remember your face and I’m ready for war."
    },
    {
      "id": "46",
      "quote": "We were friends, and I loved you. We’re lovers, and I love you more."
    },
    {
      "id": "47",
      "quote": "You never lose by loving. You always lose by holding back."
    },
    {
      "id": "48",
      "quote": "If I could give you one thing in life, I would give you the ability to see yourself through my eyes, only then would you realize how special you are to me."
    },
    {
      "id": "49",
      "quote": "My mind wanders and I get lost in thoughts of you."
    },
    {
      "id": "50",
      "quote": "Your smile warms my heart even when the world feels like it’s crashing down on me."
    },
    {
      "id": "51",
      "quote": "I love you more today than yesterday, but not as much as tomorrow."
    },
    {
      "id": "52",
      "quote": "You may not be perfect; you are flawed like all humans. But you are perfect to me and that’s all that matters."
    },
    {
      "id": "53",
      "quote": "A sea of whiskey couldn’t intoxicate me as much as a drop of you."
    },
    {
      "id": "54",
      "quote": "The day I met you, I found my missing piece. You complete me and make me a better person. I love you with all my heart and all my soul."
    },
    {
      "id": "55",
      "quote": "The reason I smile is you. The reason I believe in love is you. The reason I breathe is you. The reason I’m alive is you."
    },
    {
      "id": "56",
      "quote": "I need you like a heart needs a beat."
    },
    {
      "id": "57",
      "quote": "You know you're in love when you can't fall asleep because reality is finally better than your dreams."
    },
    {
      "id": "58",
      "quote": "The water shines only by the sun. And it is you who are my sun."
    },
    {
      "id": "59",
      "quote": "Being deeply loved by someone gives you strength while loving someone deeply gives you courage."
    },
    {
      "id": "60",
      "quote": "You won my heart when you glanced at me and you swept me off my feet with just one kiss."
    },
    {
      "id": "61",
      "quote": "You’re that part of me I’ll always need."
    },
    {
      "id": "62",
      "quote": "Darling, you brighten my day with the love that you bring to my life. At night, the stars align to shine their light on me and that is all because of you, I love you!"
    },
    {
      "id": "63",
      "quote": "Gratitude is all I have to God for giving you to me."
    },
    {
      "id": "64",
      "quote": "In all the world, there is no heart for me like yours. In all the world, there is no love for you like mine."
    },
    {
      "id": "65",
      "quote": "I love you more than words can show, I think about you more than you could."
    },
    {
      "id": "66",
      "quote": "I don't need paradise because I found you. I don't need dreams because I already have you."
    },
    {
      "id": "67",
      "quote": "You want to know who I’m in love with? Read the first word again."
    },
    {
      "id": "68",
      "quote": "I choose you. And I’ll choose you over and over and over. Without pause, without a doubt, in a heartbeat. I’ll keep choosing you."
    },
    {
      "id": "69",
      "quote": "He smiled, and all I could think was ‘Oh shit.’"
    },
    {
      "id": "70",
      "quote": "When I looked into your eyes I didn't see just you, I saw my today, my tomorrow and my future for the rest of my life."
    },
    {
      "id": "71",
      "quote": "Just when I think that it is impossible to love you any more, you prove me wrong."
    },
    {
      "id": "72",
      "quote": "All that you are is all that I’ll ever need."
    },
    {
      "id": "73",
      "quote": "I can be annoying, weird, and sometimes overly emotional. But I'll always love you like there's no tomorrow."
    },
    {
      "id": "74",
      "quote": "I love you and that’s the beginning and end of everything."
    },
    {
      "id": "75",
      "quote": "If I had to make a wish I would wish to wake up by your side every morning. I love you more than anyone."
    },
    {
      "id": "76",
      "quote": "I love you more than coffee, but please don’t make me prove it."
    },
    {
      "id": "77",
      "quote": "I never want to live without you. If you live to 100, I want to live to 100 minus one second, so we never have to be apart."
    },
    {
      "id": "78",
      "quote": "Every day I become surer that you're the one."
    },
    {
      "id": "79",
      "quote": "No matter what has happened, no matter what you’ve done, no matter what you will do, I will always love you. I swear it."
    },
    {
      "id": "80",
      "quote": "I fell in love with the way you touched me without using your hands."
    },
    {
      "id": "81",
      "quote": "I love you like how potbellied policemen are obsessed with donuts and how chubby kids love ice cream."
    },
    {
      "id": "82",
      "quote": "You’re my spark in the dark."
    },
    {
      "id": "83",
      "quote": "When I watch you sleep or we're just looking at each other, I feel so grateful that I have a wonderful, loving, sweet, and funny boyfriend like you."
    },
    {
      "id": "84",
      "quote": "I love you and I don’t want to lose you. Because my life has been better since the day I found out."
    },
    {
      "id": "85",
      "quote": "I've been yours since the second we met."
    },
    {
      "id": "86",
      "quote": "All of the blood, sweat, and tears are worth the sacrifice when you’re in my arms."
    },
    {
      "id": "87",
      "quote": "If I had a flower for every time I thought of you. I could walk through my garden forever."
    },
    {
      "id": "88",
      "quote": "Lying in your loving arms is heaven on earth."
    },
    {
      "id": "89",
      "quote": "I still remember the feeling I felt when I first started talking to you."
    },
    {
      "id": "90",
      "quote": "This is a thank you for every hour we have spent together, for every kiss, for every embrace, and for every tear shed for one another."
    },
    {
      "id": "91",
      "quote": "You are the missing piece to my life. You are the answer to my prayers."
    },
    {
      "id": "92",
      "quote": "My love for you is past the mind, beyond my heart, and into my soul."
    },
    {
      "id": "93",
      "quote": "You are the single greatest source of my joy. You are the sun of my life and I revolve around you, you nourish me, you give me life."
    },
    {
      "id": "94",
      "quote": "Hold my hand, and I will go anywhere with you."
    },
    {
      "id": "95",
      "quote": "I always hope you're looking at me while I'm looking away."
    },
    {
      "id": "96",
      "quote": "I like you. Like, I really like you. Like, I'm over heels, you're on my mind way too much, I'm singing stupid love songs really like you."
    },
    {
      "id": "97",
      "quote": "Your angelic face leaves me breathless."
    },
    {
      "id": "98",
      "quote": "One day, I caught myself smiling without reason, then I realized I was thinking of you."
    },
    {
      "id": "99",
      "quote": "If you remember me, then I don’t care if everyone else forgets."
    },
    {
      "id": "100",
      "quote": "Ever since I met you, no one else has been worth thinking about."
    },
    {
      "id": "101",
      "quote": "I saw that you were perfect, and so I loved you. Then I saw that you were not perfect and I loved you even more."
    },
    {
      "id": "102",
      "quote": "You're mine and only mine, all rights reserved."
    },
    {
      "id": "103",
      "quote": "You make me wake up with a smile on my face every day. You are the air I breathe, the ticking in my heart."
    },
    {
      "id": "104",
      "quote": "There is a madness in loving you, a lack of reason that makes it feel so flawless."
    },
    {
      "id": "105",
      "quote": "Chemistry is you touching my mind and it setting my body on fire."
    },
    {
      "id": "106",
      "quote": "Love is a beautiful thing. But our love is the most beautiful thing in the world."
    },
    {
      "id": "107",
      "quote": "If you live to be a hundred, I want to live to be a hundred minus one day, so I never have to live without you."
    },
    {
      "id": "108",
      "quote": "If you find someone you love in your life, then hang on to that love."
    },
    {
      "id": "109",
      "quote": "If I did anything right in my life, it was when I gave my heart to you."
    },
    {
      "id": "110",
      "quote": "Absence is to love as wind is to fire; It extinguishes the small and kindles the great."
    },
    {
      "id": "111",
      "quote": "Before you came into my life, I never knew what true love felt like."
    },
    {
      "id": "112",
      "quote": "I am who I am because of you. You are every reason, every hope, and every dream I’ve ever had."
    },
    {
      "id": "113",
      "quote": "I love you the way a drowning man needs air. And it would destroy me to have you just a little."
    },
    {
      "id": "114",
      "quote": "I wish I could see the look on your face when you read my texts."
    },
    {
      "id": "115",
      "quote": "The scariest thing about distance is you don’t know if they’ll miss you or forget about you."
    },
    {
      "id": "116",
      "quote": "You’re all that is good in my life; the inspiration in everything that I do is you."
    },
    {
      "id": "117",
      "quote": "You are the one girl that made me risk everything for a future worth having."
    },
    {
      "id": "118",
      "quote": "Kiss me and you will see how important I am."
    },
    {
      "id": "119",
      "quote": "I love you not only for what you are but for what I am when I am with you."
    },
    {
      "id": "120",
      "quote": "When I tell you I love you, I am not saying it out of habit, I am reminding you that you are my life."
    },
    {
      "id": "121",
      "quote": "I’d rather spend one moment holding you than a lifetime knowing I never could."
    },
    {
      "id": "122",
      "quote": "I love you the way a drowning man loves air. And it would destroy me to have you just a little."
    },
    {
      "id": "123",
      "quote": "It doesn’t matter where I am. I’m yours."
    },
    {
      "id": "124",
      "quote": "This is for all the simple little things you have done for me that in time have added up to be so great."
    },
    {
      "id": "125",
      "quote": "You are my morning sunshine after a dark night."
    },
    {
      "id": "126",
      "quote": "For it was not into my ear you whispered, but into my heart. It was not my lips you kissed, but my soul."
    },
    {
      "id": "127",
      "quote": "Ever since the day you came into my life, I know you’re the only one I’ll truly love to an end."
    },
    {
      "id": "128",
      "quote": "You're worth every mile between us."
    },
    {
      "id": "129",
      "quote": "I love you, and I will love you until I die, and if there’s a life after that, I’ll love you then."
    },
    {
      "id": "130",
      "quote": "I hope you know that every time I tell you to get home safe, stay warm, have a good day or good night, what I'm really saying is I love you. I love you so damn much that it is starting to steal the meaning of other words."
    },
    {
      "id": "131",
      "quote": "I like the way you make me feel even when I’m nowhere near."
    },
    {
      "id": "132",
      "quote": "I love you as certain dark things are to be loved in secret, between the shadow and the soul."
    },
    {
      "id": "133",
      "quote": "Sometimes my eyes get jealous of my heart. Because you always remain close to my heart and far from my eyes."
    },
    {
      "id": "134",
      "quote": "I know that miracles do happen because I met you."
    },
    {
      "id": "135",
      "quote": "Love me without fear. Trust me without questioning. Need me without demanding. Want me without restrictions. Accept me without change. Love me for who I am."
    },
    {
      "id": "136",
      "quote": "No matter where I went, I always knew my way back to you. You are my compass star."
    },
    {
      "id": "137",
      "quote": "There’s just something about you I’m scared to lose because I know I won’t find it in anyone else."
    },
    {
      "id": "138",
      "quote": "Being in love doesn’t make me happy. Being in love with you is what makes me happy."
    },
    {
      "id": "139",
      "quote": "I wish you to know that you have been the last dream of my soul."
    },
    {
      "id": "140",
      "quote": "If I had a flower for every time I thought of you … I could walk through my garden forever."
    },
    {
      "id": "141",
      "quote": "I really believe that you are the greatest thing that ever happened to me."
    },
    {
      "id": "142",
      "quote": "My love for you has no depth, its boundaries are ever-expanding. My love and my life with you will be a never-ending story."
    },
    {
      "id": "143",
      "quote": "You have my whole heart for my whole life."
    },
    {
      "id": "144",
      "quote": "I’d rather see you one day a year than someone else seven days a week."
    },
    {
      "id": "145",
      "quote": "The moment when he rolls over puts his arm around me and pulls me closer in his sleep, this makes my life complete."
    },
    {
      "id": "146",
      "quote": "If you're wondering whether or not I'm thinking of you, the answer is yes."
    },
    {
      "id": "147",
      "quote": "Your absence has not taught me how to be alone; it has merely shown me that when together we cast a single shadow on the wall."
    },
    {
      "id": "148",
      "quote": "You magically captivated my soul."
    },
    {
      "id": "149",
      "quote": "I never thought love could be so magnificent until I saw the sincere look in your eyes, telling me that this time¦ I would never shed another tear."
    },
    {
      "id": "150",
      "quote": "You are imperfect, permanently and inevitably flawed. And you are beautiful."
    },
    {
      "id": "151",
      "quote": "I miss you so much more than the miles between us."
    },
    {
      "id": "152",
      "quote": "As long as I see you for a day, my day automatically gets 10 times better."
    },
    {
      "id": "153",
      "quote": "Our time together is just never quite enough."
    },
    {
      "id": "154",
      "quote": "Your words are my food, your breath my wine. You are everything to me."
    },
    {
      "id": "155",
      "quote": "You are extraordinary, exquisite, impressive, magical and I am so in love with you."
    },
    {
      "id": "156",
      "quote": "The chances of meeting you on this planet are like finding a needle in haystack – a miracle happened."
    },
    {
      "id": "157",
      "quote": "You are my heart, my life, my one and only thought."
    },
    {
      "id": "158",
      "quote": "If you only knew how much those little moments with you mattered to me."
    },
    {
      "id": "159",
      "quote": "I may not be your first date, kiss or love. but I want to be your last everything."
    },
    {
      "id": "160",
      "quote": "I am reborn when you kiss me. I would die if you left me. The moments I am with you are when I am truly alive."
    },
    {
      "id": "161",
      "quote": "You stole my heart, but I’ll let you keep it."
    },
    {
      "id": "162",
      "quote": "I don’t want to be your favorite or your best. I want to be your only and forget the rest."
    },
    {
      "id": "163",
      "quote": "I never loved you any more than I do, right this second. And I’ll never love you any less than I do, right this second."
    },
    {
      "id": "164",
      "quote": "I love it when we can be weird together."
    },
    {
      "id": "165",
      "quote": "Each day I love you more, today more than yesterday and less than tomorrow."
    },
    {
      "id": "166",
      "quote": "The sweetest thing I love coming home to every day is you."
    },
    {
      "id": "167",
      "quote": "I want to wake up at 2 am, roll over, see your face, and know that I’m right where I’m supposed to be."
    },
    {
      "id": "168",
      "quote": "If you remember me, then I don’t care if everyone else forgets."
    },
    {
      "id": "169",
      "quote": "The last of your kisses was ever the sweetest; the last smile the brightest; the last movement the most graceful."
    },
    {
      "id": "170",
      "quote": "I still get goosebumps whenever you touch me."
    },
    {
      "id": "171",
      "quote": "Being in love with you makes every morning worth getting up for."
    },
    {
      "id": "172",
      "quote": "Time and time again I have to pinch myself when I see you next to me. You are my dream come true."
    },
    {
      "id": "173",
      "quote": "Time and time again I have to pinch myself when I see you next to me. You are my dream come true."
    },
    {
      "id": "174",
      "quote": "When I listen to my heart, it whispers your name."
    },
    {
      "id": "175",
      "quote": "The water shines only by the sun. And it is you who are my sun."
    },
    {
      "id": "176",
      "quote": "I want the part of you that you refuse to give to anyone."
    },
    {
      "id": "177",
      "quote": "Your voice is my favorite sound."
    },
    {
      "id": "178",
      "quote": "Believing that you are mine forever is what makes me get up in the mornings."
    },
    {
      "id": "179",
      "quote": "Out of sight but babe you are never off my mind."
    },
    {
      "id": "180",
      "quote": "There are only two times that I want to be with you. Now and Forever."
    },
    {
      "id": "181",
      "quote": "They say the sweetest place to be is in someone’s thoughts. You never leave mine."
    },
    {
      "id": "182",
      "quote": "You are my today and all of my tomorrows."
    },
    {
      "id": "183",
      "quote": "ou are, and always have been, my dream."
    },
    {
      "id": "184",
      "quote": "I need you because you make me laugh more than anyone else and I'm the best me when I'm with you. And when you're gone, nothing feels right until you return."
    },
    {
      "id": "185",
      "quote": "I could start a fire with what I feel for you."
    },
    {
      "id": "186",
      "quote": "I love it when you send me those texts that make me smile no matter how many times I read them."
    },
    {
      "id": "187",
      "quote": "Through thick or thin, I'll accept you at your strongest yet love and support you at your weakest."
    },
    {
      "id": "188",
      "quote": "I would be nothing without your unconditional and undying love."
    },
    {
      "id": "189",
      "quote": "I just want to lay on your chest and listen to your heartbeat."
    },
    {
      "id": "190",
      "quote": "Loving you never was an option. It was a necessity."
    },
    {
      "id": "191",
      "quote": "When I think of you, I see your name with hearts floating in front of my eyes."
    },
    {
      "id": "192",
      "quote": "You make my dopamine levels go all silly."
    },
    {
      "id": "193",
      "quote": "Each time I see you, I stop breathing for a second."
    },
    {
      "id": "194",
      "quote": "I love you begins by I, but it ends up by you."
    },
    {
      "id": "195",
      "quote": "When I tell you I love you, I am not saying it out of habit, I am reminding you that you are my life."
    },
    {
      "id": "196",
      "quote": "Kissing you is my favorite hobby. Holding you is my favorite pastime."
    },
    {
      "id": "197",
      "quote": "When our hair becomes grey and our faces get wrinkles, I will still want you around."
    },
    {
      "id": "198",
      "quote": "Everything I’ve never done, I want to do with you."
    },
    {
      "id": "199",
      "quote": "To lose balance sometimes for love is part of living a balanced life."
    },
    {
      "id": "200",
      "quote": "You have bewitched me, body and soul, and I love… I love… I love you."
    },
    {
      "id": "201",
      "quote": "One glance at you, that's all it takes to make my heart beat faster."
    },
    {
      "id": "202",
      "quote": "The brightness of my day doesn`t depend on the amount of sunshine. Everything depends on your smile."
    },
    {
      "id": "203",
      "quote": "You may not always be perfect, but you will always be perfect for me."
    },
    {
      "id": "204",
      "quote": "I love you not because of anything you have, but because of something that I feel when I’m near you."
    },
    {
      "id": "205",
      "quote": "In a sea of people, my eyes will always be searching for you."
    },
    {
      "id": "206",
      "quote": "I want to be the girl who makes you say, ‘My life has changed since I met her."
    },
    {
      "id": "207",
      "quote": "I know I am in love with you because my reality is finally better than my dreams."
    },
    {
      "id": "208",
      "quote": "When I look at you, all I want to do is kiss you."
    },
    {
      "id": "209",
      "quote": "I`ll allow you to appear in my dreams every night if I`ll be allowed to be in yours."
    },
    {
      "id": "210",
      "quote": "I never knew what love was until I met you, then when distance pulled us apart, I found out what true love is."
    },
    {
      "id": "211",
      "quote": "I never knew what love was until I met you, then when distance pulled us apart, I found out what true love is."
    },
    {
      "id": "212",
      "quote": "Yeah, I'm thinking about you right now and no I can't stop."
    },
    {
      "id": "213",
      "quote": "My favorite place is inside your hug."
    },
    {
      "id": "214",
      "quote": "I love how you take care of me and how you keep working to be a better man even on days that I fail to be a better woman."
    },
    {
      "id": "215",
      "quote": "I found my home and paradise with you."
    },
    {
      "id": "216",
      "quote": "Your smile is like the sunshine and it brightens up my day. Your thoughts in my head create the sweetest melody and I can’t help but fall for you."
    },
    {
      "id": "217",
      "quote": "Even after we're married for 30 years, I'll still want you to flirt with me."
    },
    {
      "id": "218",
      "quote": "My name sounds even cuter with your last name added to it."
    },
    {
      "id": "219",
      "quote": "I always tried to act happy. Now, I have found real happiness with you."
    },
    {
      "id": "220",
      "quote": "Give me a kiss and I’ll serenade you among the stars. Give me your love and I will pluck each star to set at your feet."
    },
    {
      "id": "221",
      "quote": "I wish I could turn back the clock. I’d find you sooner and love you longer."
    },
    {
      "id": "222",
      "quote": "Love quotes for him to have him all over you."
    },
    {
      "id": "223",
      "quote": "I know you, and I can openly say how love looks like."
    },
    {
      "id": "224",
      "quote": "Some people search their whole lives to find what I found in you."
    },
    {
      "id": "225",
      "quote": "I love the way you laugh, I love the way you smile. I love the way you make me feel every single time. You are the one who takes away the blues. That is the reason why I am so in love with you!"
    },
    {
      "id": "226",
      "quote": "I am happiest when I’m right next to you."
    },
    {
      "id": "227",
      "quote": "When I want to smile, I know exactly what to do, I just close my eyes and think of you."
    },
    {
      "id": "228",
      "quote": "I wanna live, sleep, and wake up by your side."
    },
    {
      "id": "229",
      "quote": "I like the way we feel together. We fit. I've never fit with anyone the way that we do."
    },
    {
      "id": "230",
      "quote": "Thank you for staying even if you had every reason to leave. Thank you for making it easier when life gets hard."
    },
    {
      "id": "231",
      "quote": "I’ve fallen in love many times… but always with you."
    },
    {
      "id": "232",
      "quote": "Why can’t you just magically pop into my room with me and just cuddle for the rest of the night and kiss my head when I start to fall asleep?"
    },
    {
      "id": "233",
      "quote": "I made a wish and you came true."
    },
    {
      "id": "234",
      "quote": "I am very indecisive and always have trouble picking my favorite anything. But, without a doubt, you are my favorite everything."
    },
    {
      "id": "235",
      "quote": "Loving you was never an option. It was a necessity."
    },
    {
      "id": "236",
      "quote": "Tell me who admires you and loves you, and I will tell you who you are."
    },
    {
      "id": "237",
      "quote": "It wasn't loved at first sight. I knew the moment my heart skipped a beat you would be mine forever."
    },
    {
      "id": "238",
      "quote": "I am difficult but I promise I am worth it."
    },
    {
      "id": "239",
      "quote": "Thank you for stealing my eyes from the crowd and stealing my heart from me."
    },
    {
      "id": "240",
      "quote": "I don’t wanna close my eyes, I don’t wanna fall asleep, cuz I’d miss you babe and I don’t wanna miss a thing."
    },
    {
      "id": "241",
      "quote": "Thank you for staying by my side even though I tried to push you away."
    },
    {
      "id": "242",
      "quote": "When I think rain, I think about singing. When I think about singing, it’s a heavenly tune. When I think about heaven then I think about angels. When I think about angels, I think about you."
    },
    {
      "id": "243",
      "quote": "I can’t stop thinking about you, today… tomorrow… always."
    },
    {
      "id": "244",
      "quote": "Making your dream come true is my dream come true."
    },
    {
      "id": "245",
      "quote": "I don’t need paradise because I found you. I don’t need dreams because I already have you. All I want is the taste that your lips allow."
    },
    {
      "id": "246",
      "quote": "I am here, I will always be here. Watching you, loving you."
    },
    {
      "id": "247",
      "quote": "Even if I was the busiest person in the world, I'd always find time for you."
    },
    {
      "id": "248",
      "quote": "Thank you for always being my rainbow after the storm."
    },
    {
      "id": "249",
      "quote": "No matter how bad things get or how sad I feel, whenever I see you I can't help but to smile and realize you'll always be there to support me."
    },
    {
      "id": "250",
      "quote": "I loved you, I love you, I will always love you forever and ever."
    },
  ];

  static String getQuote() {
    final random = Random();
    final randomIndex = random.nextInt(content.length);
    return content[randomIndex]["quote"];
  }
}