import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Widgets/terms_and_conditions.dart';
import 'package:uni/view/theme.dart';
import 'package:uni/utils/constants.dart' as Constants;

import '../../model/app_state.dart';

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final String faculty = 'feup';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  static final FocusNode usernameFocus = FocusNode();
  static final FocusNode passwordFocus = FocusNode();

  static final TextEditingController usernameController =
      TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static bool _exitApp = false;
  bool _keepSignedIn = false;
  bool _obscurePasswordInput = true;

  void _login(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    if (store.state.content['loginStatus'] != RequestStatus.busy &&
        _formKey.currentState.validate()) {
      final user = usernameController.text.trim();
      final pass = passwordController.text.trim();
      store.dispatch(login(user, pass, faculty, _keepSignedIn,
          usernameController, passwordController));
    }
  }

  void _setKeepSignedIn(value) {
    setState(() {
      _keepSignedIn = value;
    });
  }

  void _toggleObscurePasswordInput() {
    setState(() {
      _obscurePasswordInput = !_obscurePasswordInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: primaryColor,
        body: WillPopScope(
            child: Padding(
                padding: EdgeInsets.only(
                    left: queryData.size.width / 8,
                    right: queryData.size.width / 8),
                child: ListView(
                  children: getWidgets(context, queryData),
                )),
            onWillPop: () => onWillPop(context)));
  }

  List<Widget> getWidgets(BuildContext context, MediaQueryData queryData) {
    final List<Widget> widgets =  [];

    widgets.add(
        Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 20)));
    widgets.add(createTitle(queryData, context));
    widgets.add(
        Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 35)));
    widgets.add(getLoginForm(queryData, context));
    widgets.add(
        Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 15)));
    widgets.add(createLogInButton(queryData));
    widgets.add(
        Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 35)));
    widgets.add(createStatusWidget(context));
    widgets.add(
        Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 35)));
    widgets.add(createSafeLoginButton(context));

    return widgets;
  }

  void displayToastMessage(BuildContext context, String msg) {
    Toast.show(
      msg,
      context,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM,
      backgroundColor: toastColor,
      backgroundRadius: 16.0,
      textColor: Colors.white,
    );
  }

  Future<void> exitAppWaiter() async {
    _exitApp = true;
    await Future.delayed(Duration(seconds: 2));
    _exitApp = false;
  }

  Future<bool> onWillPop(BuildContext context) {
    if (_exitApp) {
      return Future.value(true);
    }
    displayToastMessage(context, 'Pressione novamente para sair');
    exitAppWaiter();
    return Future.value(false);
  }

  Widget createTitle(queryData, context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: queryData.size.width / 8,
          minHeight: queryData.size.height / 6,
        ),
        child: Column(children: [
          SizedBox(
              child: SvgPicture.asset(
                'assets/images/logo_dark.svg',
                color: Colors.white,
              ),
              width: 100.0),
        ]));
  }

  Widget getLoginForm(MediaQueryData queryData, BuildContext context) {
    return Form(
      key: this._formKey,
      child: SingleChildScrollView(
        child: Column(children: [
          createUsernameInput(context),
          Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 35)),
          createPasswordInput(),
          Padding(padding: EdgeInsets.only(bottom: queryData.size.height / 35)),
          createSaveDataCheckBox()
        ]),
      ),
    );
  }

  Widget createUsernameInput(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 20),
      enableSuggestions: false,
      autocorrect: false,
      autofocus: false,
      controller: usernameController,
      focusNode: usernameFocus,
      onFieldSubmitted: (term) {
        usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.left,
      decoration: textFieldDecoration('número de estudante'),
      validator: (String value) => value.isEmpty ? 'Preencha este campo' : null,
    );
  }

  Widget createPasswordInput() {
    return TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 20),
        enableSuggestions: false,
        autocorrect: false,
        autofocus: false,
        controller: passwordController,
        focusNode: passwordFocus,
        onFieldSubmitted: (term) {
          passwordFocus.unfocus();
          _login(context);
        },
        textInputAction: TextInputAction.done,
        obscureText: _obscurePasswordInput,
        enableInteractiveSelection: !_obscurePasswordInput,
        textAlign: TextAlign.left,
        decoration: passwordFieldDecoration('palavra-passe'),
        validator: (String value) =>
            value.isEmpty ? 'Preencha este campo' : null);
  }

  Widget createSaveDataCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Manter sessão iniciada',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w300)),
        Checkbox(
          value: _keepSignedIn,
          onChanged: _setKeepSignedIn,
          focusNode: passwordFocus,
        )
      ],
    );
  }

  Widget createLogInButton(queryData) {
    return Padding(
      padding: EdgeInsets.only(
          left: queryData.size.width / 7, right: queryData.size.width / 7),
      child: SizedBox(
        height: queryData.size.height / 16,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            primary: Colors.white,
          ),
          onPressed: () {
            if (!FocusScope.of(context).hasPrimaryFocus) {
              FocusScope.of(context).unfocus();
            }
            _login(context);
          },
          child: Text('Entrar',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget createStatusWidget(BuildContext context) {
    return StoreConnector<AppState, RequestStatus>(
        converter: (store) => store.state.content['loginStatus'],
        onWillChange: (oldStatus, status) {
          if (
            status == RequestStatus.successful &&
            StoreProvider.of<AppState>(context).
              state.content['session'].authenticated
          ){
            Navigator.pushReplacementNamed(context, '/' + Constants.navPersonalArea);
          } else if (status == RequestStatus.failed) {
            displayToastMessage(context, 'O login falhou');
          }
        },
        builder: (context, status) {
          switch (status) {
            case RequestStatus.busy:
              return Container(
                height: 60.0,
                child: Center(child: CircularProgressIndicator()),
              );
            default:
              return Container();
          }
        });
  }

  InputDecoration textFieldDecoration(String placeholder) {
    return InputDecoration(
        errorStyle: TextStyle(
          color: Colors.white70,
        ),
        hintText: placeholder,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3)));
  }

  InputDecoration passwordFieldDecoration(String placeholder) {
    final genericDecoration = textFieldDecoration(placeholder);
    return InputDecoration(
        errorStyle: genericDecoration.errorStyle,
        hintText: genericDecoration.hintText,
        contentPadding: genericDecoration.contentPadding,
        border: genericDecoration.border,
        focusedBorder: genericDecoration.focusedBorder,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePasswordInput ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleObscurePasswordInput,
          color: Theme.of(context).accentColor,
        ));
  }

  createSafeLoginButton(BuildContext context) {
    return InkResponse(
        onTap: () {
          _showLoginDetails(context);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              '''Ao entrares confirmas que concordas com estes Termos e Condições''',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300),
            )));
  }

  Future<void> _showLoginDetails(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Termos e Condições'),
            content: SingleChildScrollView(child: TermsAndConditions()),
            actions: <Widget>[
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          );
        });
  }
}
