import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/main.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/app_bar_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/normal_text_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/text_widget.dart';
import 'package:ecommerce_bloc/views/sign_in_view/widgets/sign_in_button_widget.dart';
import 'package:ecommerce_bloc/views/sign_in_view/widgets/sign_in_email_input_widget.dart';
import 'package:ecommerce_bloc/views/sign_in_view/widgets/sign_in_password_input_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/email_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/password_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/sign_up_button_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/signup_image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var nameFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  var addressFocusNode = FocusNode();
  var phoneFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late SignInBloc signInBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInBloc = SignInBloc(signinRepository: getIt());
  }

  @override
  void dispose() {
    super.dispose();
    signInBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => signInBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBarWidget(title: "Sign In")),
        body: Form(
            key: globalKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Sign In!"),
                    const SizedBox(
                      height: 20,
                    ),
                    SignInEmailInputWidget(
                        controller: emailController, focusNode: emailFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    SignInPasswordInputWidget(
                        controller: passwordController,
                        focusNode: passwordFocusNode),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Column(
                      children: [
                        SignInButtonWidget(
                          globalKey: globalKey,
                          password: passwordController,
                          email: emailController,
                          borderRadius: BorderRadius.circular(10),
                          buttonText: "SignUp",
                          buttonColor: 0xff2196f3,
                          height: 40,
                          widget: 250,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.signupViewRoute);
                            },
                            child: NormalTextWidget(
                                text: "Don't have an account? SigUp")),
                      ],
                    ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
