import 'package:test_quiz/models/game_sessions_model.dart';

List<String> audioUrls = [
  "https://server6.mp3quran.net/kurdi/076.mp3",
  "https://server6.mp3quran.net/kurdi/076.mp3",
  "https://server6.mp3quran.net/kurdi/076.mp3",
];
List<String>videoUrls=[
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
];
List<QuizDetail>audioQuizDetails=[
  QuizDetail(
      quizID: "719",
      question: "What is the highest mountain in the world?",
      noOfChoice: "4",
      answer1: "Mount Godwin Austen",
      answer2: "Mt. Everest",
      answer3: "Kangchenjunga",
      answer4: "Annapurna",
      correctAnswer: "Mt. Everest",
      media: "https://server6.mp3quran.net/kurdi/076.mp3",
      quizType: "Audio"
  ),
QuizDetail(
quizID: "819",
question: "What US state celebrates King Kamehameha Day every June 11?",
noOfChoice: "4",
answer1: "Texas",
answer2: "Hawaii",
answer3: "Florida",
answer4: "Alaska",
correctAnswer: "Hawaii",
media: "https://server6.mp3quran.net/kurdi/076.mp3",
quizType: "Audio"
),
  QuizDetail(
quizID: "879",
question: "Which country is separated from Italy by the Strait of Otranto?",
noOfChoice: "4",
answer1: "Romania",
answer2: "Greece",
answer3: "Albania",
answer4: "Bulgaria",
correctAnswer: "Albania",
media: "https://res.cloudinary.com/iq-stars/video/upload/v1619884886/b_cut_en26td.mp3",
quizType: "Audio"
  )
];

List<QuizDetail>videoQuizDetails=[
  QuizDetail(
      quizID: "719",
      noOfChoice: "4",
      answer1: "Mount Godwin Austen",
      answer2: "Mt. Everest",
      answer3: "Kangchenjunga",
      answer4: "Annapurna",
      correctAnswer: "Mt. Everest",
      media: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      quizType: "Video"
  ),
  QuizDetail(
      quizID: "819",
      noOfChoice: "4",
      answer1: "Texas",
      answer2: "Hawaii",
      answer3: "Florida",
      answer4: "Alaska",
      correctAnswer: "Hawaii",
      media: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      quizType: "Video"
  ),
  QuizDetail(
      quizID: "879",
      noOfChoice: "4",
      answer1: "Romania",
      answer2: "Greece",
      answer3: "Albania",
      answer4: "Bulgaria",
      correctAnswer: "Albania",
      media: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      quizType: "Video"
  )
];
List<QuizDetail>imagesQuizDetails=[
 QuizDetail(

      quizID: "15",
      question: "By what name was the author Eric Blair better known?",
      noOfChoice: "4",
      answer1: "Aldous Huxley",
      answer2: "George Orwell",
      answer3: "Ernest Hemingway",
      answer4: "Ray Bradbury",
      correctAnswer: "George Orwell",
      media: "https://res.cloudinary.com/iq-stars/image/upload/v1619885018/Taylor_Swift_rssffr.jpg",
      quizType: "Image"
),

QuizDetail(
      quizID: "286",
      question: "What Magic The Gathering card's flavor text is just 'Ribbit.'?",
      noOfChoice: "4",
      answer1: "Turn to Frog",
      answer2: "Spore Frog",
      answer3: "Bloated Toad",
      answer4: "Frogmite",
      correctAnswer: "Turn to Frog",
      media: "https://res.cloudinary.com/iq-stars/image/upload/v1619885018/Taylor_Swift_rssffr.jpg",
      quizType: "Image"
),
QuizDetail(
      quizID: "464",
      question: "Who is Batman?",
      noOfChoice: "4",
      answer1: "Bruce Wayne",
      answer2: "Clark Kent",
      answer3: "Barry Allen",
      answer4: "Tony Stark",
      correctAnswer: "Bruce Wayne",
      media: "https://res.cloudinary.com/iq-stars/image/upload/v1619885018/Taylor_Swift_rssffr.jpg",
      quizType: "Image"
),

  ];


