import 'package:flutter_quiz/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.itemData,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = (itemData['user_answer'] as String) ==
        (itemData['correct_answer'] as String);

    return Padding(
      //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: ((itemData['question_index'] as int) + 1)),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (itemData['question'] as String),
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('Correct: ${itemData['correct_answer'] as String}'),
                Text(
                  'User: ${itemData['user_answer'] as String}',
                  style: GoogleFonts.lato(
                    color: isCorrectAnswer ? Colors.cyan : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
