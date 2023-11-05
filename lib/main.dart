import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';

void main() {
  runApp(const MaterialApp(
    home: QuestionsScreen(),
  ));
}

// Stateless => Ekranda değişime uğramayacak , UI widget

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 200,
            ),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.red, fontSize: 36, fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20)),
            )
          ],
        ),
      ),
    );
  }
}

// Boilerplate

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsScreen> {
  int questionIndex = 0;
 // List<String> answers = ["Cevap 1","Cevap 2","Cevap 3","Cevap 4"];

  void changeQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[questionIndex].question),
            ...questions[questionIndex].answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  if (questionIndex < 3) {changeQuestion();}
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style:const TextStyle(color: Colors.white),
                ));
            })
               
   
          ],
        ),
      ),
    );
  }
}
