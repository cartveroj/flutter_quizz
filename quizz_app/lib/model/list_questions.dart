import 'package:quizz_app/model/questions.dart';

const List<Question> questions = [
  Question(
      correctAnswerIndex: 0,
      question: '1.-¿Qué es una variable en programación?',
      options: [
        'a) Es un espacio en la memoria donde se almacena un valor',
        'b) Una función del programa',
        'c) Un hardware de la computadora',
      ]),
  Question(
      correctAnswerIndex: 2,
      question:
          '2.-¿Cuál es la diferencia entre un lenguaje de programación de alto nivel y uno de bajo nivel?',
      options: [
        'a) Los de bajo nivel se ejecutan más rápido',
        'b) Los de alto nivel son más difíciles de aprender',
        'c) Los de alto nivel son más cercanos al lenguaje humano',
      ]),
  Question(
      correctAnswerIndex: 1,
      question: '3.-¿Qué es una función en programación?',
      options: [
        'a) Un hardware de la computadora',
        'b) Una secuencia de instrucciones que realiza una tarea específica',
        'c) Una estructura de datos',
      ]),
];
