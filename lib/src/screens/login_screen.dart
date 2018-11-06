import 'package:flutter/material.dart';

//importing the bloc class which in turn will give us access to the bloc init
//at the bottom of bloc class
import '../blocs/bloc.dart';
//importing the provider class
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = Provider().of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        //passing the bloc to the widget functions
        children: <Widget>[emailField(bloc), passwordField(bloc), submitButton(bloc)],
      ),
    );
  }

  //takes Bloc type variable
  Widget emailField(Bloc bloc) {
    //streamBuilders are required for on demand widget rendering using streams
    return StreamBuilder(
      //the email stream is what we are looking at
      stream: bloc.email,
      //builder takes context and snapshot
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              helperText: 'you@example.com', labelText: 'Email address',
              errorText: snapshot.error
          ),
          //the validation method is stored on bloc.changeEmail
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
              helperText: '*****', labelText: 'Password',
              errorText: snapshot.error
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return RaisedButton(
            child: Text("Login"),
            color: Colors.blue,
            //if snapshot has valid data, return the function
            onPressed: snapshot.hasData ? (){
              //calling the submit function inside bloc class
              bloc.submit();
            }
            //if snapshot has no valid data, return null
            : null
        );
      },
    );
  }
}
