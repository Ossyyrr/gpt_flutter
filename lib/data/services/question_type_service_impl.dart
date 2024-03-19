import 'dart:convert';

import 'package:open_ia_gpt_flutter/core/models/four_options_question_model.dart';
import 'package:open_ia_gpt_flutter/core/services/question_type_service_interface.dart';
import 'package:open_ia_gpt_flutter/data/services/http_service_impl.dart';

class QuestionTypeServiceImpl implements QuestionTypeServiceInterface {
  // todo: Inyectar interfaz en constructor
  QuestionTypeServiceImpl(HttpServiceImpl httpService) {
    print('constructor');
  }

  @override
  Future<FourOptionsQuestion> getFourOptionsQuestion(
      {required String topic}) async {
    try {
      final response = await HttpServiceImpl()
          .post('https://api.openai.com/v1/chat/completions', {
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            "role": "user",
            "content":
                "Dime una pregunta sobre $topic con cuatro opciones, tres incorrectas y una correcta, en formato Json, con la siguiente estructura: {'question': 'La pregunta', 'options': ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'], 'correct': 'Opción correcta'}"
          },
        ],
      });

      final responseData =
          jsonDecode(response['choices'][0]['message']['content']);

      final questionData = FourOptionsQuestion(
        question: responseData['question'],
        options: [
          responseData['options'][0],
          responseData['options'][1],
          responseData['options'][2],
          responseData['options'][3]
        ],
        correct: responseData['correct'],
      );

      return questionData;
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to load response');
    }
  }

  @override
  Future<String> getFullAnswerQuestion() {
    // TODO: implement getFullAnswerQuestion
    throw UnimplementedError();
  }

  @override
  Future<String> getNumberSliderQuestion() {
    // TODO: implement getNumberSliderQuestion
    throw UnimplementedError();
  }

  @override
  Future<String> getTrueFalseQuestion() {
    // TODO: implement getTrueFalseQuestion
    throw UnimplementedError();
  }
}
