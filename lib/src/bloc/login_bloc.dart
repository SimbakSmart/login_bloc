

import 'package:login_bloc/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'dart:async';

class LoginBloc with Validators{

  final _emailController    = rx.BehaviorSubject<String>();
  final _passwordController = rx.BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );

 
  Stream<bool> get formValidStream =>
     rx.CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);


  // Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }


}