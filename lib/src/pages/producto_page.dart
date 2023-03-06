import 'package:flutter/material.dart';

import '../models/producto_model.dart';
import '../utils/utils.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({required Key key}) : super(key: key);

  @override
  _ProductoPageState createState() {
    return _ProductoPageState();
  }
}

class _ProductoPageState extends State<ProductoPage> {


  final formKey     = GlobalKey<FormState>();
  ProductoModel producto = new ProductoModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
           onPressed: ()=> null,
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: ()=>null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:EdgeInsets.only(left: 15.0,right: 15.0),
          child: Form(
            key: formKey,
            child: Column(

              children: [
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton()
              ],

            ),
          ),
        ),
      ),
    );
  }


  Widget _crearNombre() {

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: 'Producto'
      ),
      onSaved: (value) => producto.titulo = value!,
      validator: (value) {

        if ((value?.length ?? 0).toInt()  < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );

  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
          labelText: 'Precio'
      ),
      onSaved: (value) => producto.valor = double.parse(value!),
      validator: (value) {

        if ( Utils.isNumeric(value!) ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }

  Widget _crearDisponible() {

    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        producto.disponible = value;
      }),
    );

  }



  Widget _crearBoton() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: () =>{


      },
    );
  }


}