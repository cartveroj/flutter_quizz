import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.all(35.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Aqui va el titulo',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'un poco de texto',
                        style: TextStyle(fontSize: 14),
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
                                      },
                                      child: Text(item[index]),
                                    ),
                                  ));
                        })))
          ],
        ),
      ),
    );
  }
}
