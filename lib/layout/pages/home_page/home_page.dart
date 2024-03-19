// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:open_ia_gpt_flutter/data/services/http_service_impl.dart';
import 'package:open_ia_gpt_flutter/data/services/question_type_service_impl.dart';
import 'package:open_ia_gpt_flutter/layout/pages/home_page/widgets/topic_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Askle"),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  //todo: meter getit y llamar a interfaz
                  final resp = await QuestionTypeServiceImpl(HttpServiceImpl())
                      .getFourOptionsQuestion(topic: 'historia');
                  print(resp.correct);
                },
                child: const Text('Response')),
            const Text('Ask me anything!'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 2.5,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  TopicButton(topic: 'Pokimons'),
                  TopicButton(topic: 'Historya')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
