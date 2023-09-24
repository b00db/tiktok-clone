import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmitTap() {
    _formKey.currentState?.validate();
  }

  String? _isEmailValid(email) {
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return "유효하지 않은 이메일 형식입니다.";
    }
    return null;
  }

  String? _isPasswordValid(password) {
    if (!(password.length > 8 && password.length < 20)) {
      return "유효하지 않은 비밀번호 형식입니다.";
    }
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{3,}$");
    if (!regExp.hasMatch(password)) {
      return "유효하지 않은 비밀번호 형식입니다.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) => _isEmailValid(email),
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              TextFormField(
                autocorrect: false,
                obscureText: true,
                validator: (password) => _isPasswordValid(password),
                decoration: InputDecoration(
                  hintText: 'Password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: FormButton(
                  disabled: false,
                  text: 'Log In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
