import 'dart:async';
import 'validators.dart';

//rxDart library
import 'package:rxdart/rxdart.dart';

//Class Bloc is 'Mixin' with class Validators through Object
class Bloc extends Object with Validators{
  //private streamControllers
  //BehaviorSubject is a stream controller from rxDart with more
  //functionality than a regular stream controller
  final _emailController = BehaviorSubject<dynamic>();
  final _passwordController = BehaviorSubject<dynamic>();

  //getters to add data to stream and validate them
  Stream<dynamic> get email => _emailController.stream.transform(validateEmail);
  Stream<dynamic> get password => _passwordController.stream.transform(validatePassword);

  //the getter function submitValid will observe and combine latest two events
  //from the tw getter email and password with anonymous variables e,p and return
  //true if the validators of email and password doesn't return addError
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  //getters to sink and add to stream after validation is complete
  Function(dynamic) get changeEmail => _emailController.sink.add;
  Function(dynamic) get changePassword => _passwordController.sink.add;

  //submit function takes values from the email and password controllers
  submit(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email is $validEmail \nPass is $validPassword');
  }

  //closing streams when done with activity
  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

//single scoped bloc will declare this
///final bloc = Bloc();

