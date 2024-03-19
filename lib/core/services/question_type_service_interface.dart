import 'package:open_ia_gpt_flutter/core/models/four_options_question_model.dart';

abstract class QuestionTypeServiceInterface {
  Future<FourOptionsQuestion> getFourOptionsQuestion({required String topic});
  Future<String> getTrueFalseQuestion();
  Future<String> getFullAnswerQuestion();
  Future<String> getNumberSliderQuestion();
}
