//class will validate the inputs

import 'dart:async';

class Validators {
  //streamTransformer variable takes email and sink as arguments
  final validateEmail = StreamTransformer<dynamic, dynamic>.fromHandlers(
  //handling the data using handleData:
      handleData: (email, sink) {
    if (email.toString().contains('@')) {
      sink.add(email);
    } else {
      //if doesn't contains @ returns addError property
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<dynamic, dynamic>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError("Password is incorrect");
    }
  });
}
