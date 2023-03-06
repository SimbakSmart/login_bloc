import 'package:flutter/material.dart';

import '../bloc/provider.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
      floatingActionButton: _crearBoton(context),
    );
  }

  _crearBoton(BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed:  ()=> Navigator.pushNamed(context, 'product'),
    );
  }



}
