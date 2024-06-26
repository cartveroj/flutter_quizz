import 'package:flutter/material.dart';
import 'package:quizz_app/pages/quizz_page.dart';

//usamos Stateful y createState por si se quiere añadir elementos
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; //esto se puede quitar

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //elementos que se muestran en el expanded
  List<String> item = ['Quizz 1', 'Quizz 2', 'Quizz 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 100, 104, 129),
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Padding(
                padding: EdgeInsets.all(35.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'QUIZZ GAME',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Roboto',
                            color: Colors.white),
                      ),
                      Text(
                        '¡Selecciona un test y demuestra lo que sabes!',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ])),
            Expanded(
                child: Center(
                    child: ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          //elementos
                          return //ListTile(title: Text(item[index]));
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 60.0),
                                  child: SizedBox(
                                    width: 100,
                                    height: 70,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Aquí puedes definir lo que sucede cuando el botón es presionado
                                        print(
                                            'Botón ${item[index]} presionado');
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const QuizPage(),
                                          ),
                                        );
                                      },
                                      child: Text(item[index]),
                                    ),
                                  ));
                        })))
          ],
        ),
      ),
    ));
  }
}
