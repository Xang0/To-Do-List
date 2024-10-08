import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {

  // Crio um objeto do tipo TextEditingController para poder ter acesso ao que for escrito no TextField
  TextEditingController _textEditingController = TextEditingController();

  // Criando e inicializando a lista de tarefas com uma lista vazia
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),

            Container(
              height: 400,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                controller: ScrollController(),
                itemCount: tarefas.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            padding: EdgeInsetsDirectional.only(start: 100, end: 100),
            child: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {
            
                if(_textEditingController.text.length > 0)
                {
                  setState(() {
                    tarefas.add(_textEditingController.text);
                  });
                  _textEditingController.clear();
                }
            
              },
              child: Icon(Icons.add),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(start: 100, end: 100),
            child: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {

                setState(() {
                  tarefas = [];
                });
                _textEditingController.clear();

              },
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}