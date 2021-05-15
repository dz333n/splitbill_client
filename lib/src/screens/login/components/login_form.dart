import 'package:flutter/material.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/models/login_information.dart';
import 'package:splitbill_client/src/routes/home_route.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

class _LoginInformationModel {
  String email;
  String password;
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // Believe me, it works
  static final _validEmailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  _LoginInformationModel _model;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    this._model = _LoginInformationModel();
    this._isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildEmailField(),
          _buildPasswordField(),
          SizedBox(height: 32.0),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: "User email",
      ),
      onSaved: (String value) {
        _model.email = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your email';
        }

        if (!_validEmailRegex.hasMatch(value)) {
          return 'Does not look like a valid email to me 🤷';
        }

        return null;
      },
    );
  }

  _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (String value) {
        _model.password = value;
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.vpn_key),
        labelText: "Password",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This one seems empty to me 🤔';
        }

        return null;
      },
    );
  }

  _saveForm(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState.save();

    try {
      await client.login(
        LoginInformation(
          email: _model.email,
          password: _model.password,
        ),
      );

      Application.router
          .navigateTo(context, HomeRoute.constructPath(), replace: true);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildLoginButton(BuildContext context) {
    final onPressed = _isLoading ? null : () => _saveForm(context);
    final child = _isLoading
        ? SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(),
          )
        : Text("Login");

    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
