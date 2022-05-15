import 'package:flutter/material.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class AddWidget extends StatefulWidget{
  String text;

  AddWidget(String text){
    this.text = text;
  }

  @override
  Widget Build(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
          title: Text('Novo Evento',textAlign: TextAlign.center,),
          content: Form(child: Column(
            children: [
              TextFormField(
                  cursorColor: _darkRed,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color:Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color:_darkRed)
                      ),
                      hintText: 'ex. Jantar de Curso',
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Colors.black)
                  )),
              Padding(padding: EdgeInsets.all(5),),
              TextFormField(
                  cursorColor: _darkRed,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color:Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color:_darkRed)
                      ),
                      hintText: 'ex. Dress code: formal',
                      labelText: 'Descrição',
                      labelStyle: TextStyle(color: Colors.black)
                  )),
            ],
          )),
          actions: [
            TextButton(onPressed: (){}, child: Text('Cancel')),
            TextButton(onPressed: (){}, child: Text('Accept'))]
      );
    });

    /*return AlertDialog(
      content:
      Column(
        children: [
          ElevatedButton.icon(
            label: Icon(Icons.edit, color:_darkRed),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              primary: Colors.white,
              elevation: 10
            ),
            icon: Text('Adicionar Evento')
          )
        ],
      ),
    );*/
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}