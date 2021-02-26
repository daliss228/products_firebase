import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:crud_firebase/src/blocs/validators.dart';

class LoginBloc with Validators{

  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // recuperar datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  // insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // obtener el ultimo valor que esta en el stream
  String get email => _emailController.value;
  String get password => _passwordController.value;

  // cerramos los controller
  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}