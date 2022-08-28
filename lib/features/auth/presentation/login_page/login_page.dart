import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_constant.dart';
import '../../../../utils/form_validation_mixin.dart';
import '../../../../utils/normal_navigation.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool validEmail = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => keyboardDismiss(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            children: [
              buildLoginPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 40,
                bottom: 10,
              ),
              child: CachedNetworkImage(
                imageUrl: AppConstant.loginImage,
              ),
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You can find your dating partner and date,be friend, get connected for life',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xffF8FAFB),
                filled: true,
                hintText: 'Email',
              ),
              validator: (email) {
                return isEmailValid(email!) ? null : 'Enter Valid Email';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xffF8FAFB),
                filled: true,
                hintText: 'Password',
              ),
              validator: (password) {
                return isPasswordValid(password!)
                    ? null
                    : 'Password should be atleast 8 Characters';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text(
                  'Forgot password ?',
                  style: TextStyle(
                    color: Colors.red.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                if (loginKey.currentState!.validate()) {
                  normalNavigation(context, const HomePage());
                }
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.red.withOpacity(0.8),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    height: 5,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 5,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {},
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppConstant.primaryColor),
                ),
                child: const Center(
                  child: Text(
                    'Sign UP',
                    style: TextStyle(
                      color: AppConstant.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
