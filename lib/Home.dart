import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];

    for(int i = 0; i <= 10; i++ ){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem ipsum dolor sit amet";
      item["descricao"] = "Descricao ${i} Lorem ipsum dolor sit amet";
      _itens.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
        appBar: AppBar(title: Text('Lista'),),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              return ListTile(
                onTap: (){
                  showDialog(
                    context: context,
                     builder: (context){
                       return AlertDialog(
                         title: Text(_itens[indice]["titulo"]),
                         titlePadding: EdgeInsets.all(20),
                         titleTextStyle: TextStyle(
                           fontSize: 20,
                           color: Colors.orange
                         ),
                         content: Text(_itens[indice]["descricao"]),
                         actions: [
                           TextButton(onPressed: (){
                             print("selecionado sim");
                             Navigator.pop(context);
                           }, child: Text("Sim")),
                            TextButton(onPressed: (){
                             print("selecionado não");
                             Navigator.pop(context);
                           }, child: Text("Não")
                           )
                         ],
                       );
                     }
                     );
                },
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }
            ),
          ),
    );
  }
}