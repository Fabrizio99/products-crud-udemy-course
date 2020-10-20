import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:form_validation/src/blocs/validatos.dart';

class LoginBloc with Validators{
  BehaviorSubject<String> _emailController    = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<bool> get formValidStream => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  
  String get email=>_emailController.value;
  String get password=>_passwordController.value;

  void dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}