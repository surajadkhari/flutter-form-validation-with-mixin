import 'package:flutter/material.dart';
import '../../../../core/app_constant.dart';
import '../../../../utils/form_validation_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          return currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 10,
                ),
                child: Image.asset(AppConstant.appLogo),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
