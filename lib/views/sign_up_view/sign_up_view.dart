import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/main.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/app_bar_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/normal_text_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/text_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/email_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/name_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/password_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/phone_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/select_gender_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/sign_up_button_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/signup_address_input_field_widget.dart';
import 'package:ecommerce_bloc/views/sign_up_view/widgets/signup_image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();

  var nameFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  var addressFocusNode = FocusNode();
  var phoneFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late SignupBloc signupBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signupBloc = SignupBloc(signupRepository: getIt());
  }

  @override
  void dispose() {
    super.dispose();
    signupBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => signupBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBarWidget(title: "Sign Up")),
        body: Form(
            key: globalKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Register Here!"),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(child: SignupImagePickerWidget()),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupNAMEiNPUTwIDGET(
                        controller: nameController, focusNode: nameFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    SignUpEmailInputWidget(
                        controller: emailController, focusNode: emailFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupPasswordFieldWidget(
                        controller: passwordController,
                        focusNode: passwordFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupPhoneInputFieldWidget(
                        controller: phoneController, focusNode: phoneFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupAddressInputFieldWidget(
                        controller: addressController,
                        focusNode: addressFocusNode),
                          const SizedBox(
                      height: 10,
                    ),
                    SelectGenderWidget(
                       ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Column(
                          children: [
                            SignUpButtonWidget(
                                                  globalKey: globalKey,
                                                  address: addressController,
                                                  phone: phoneController,
                                                  password: passwordController,
                                                  email: emailController,
                                                  nameController: nameController,
                                                  borderRadius: BorderRadius.circular(10),
                                                  buttonText: "SignUp",
                                                  buttonColor: 0xff2196f3,
                                                  height: 40,
                                                  widget: 250,
                                                ),
                                                const SizedBox(height: 10,),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.pushNamed(context, RouteNames.signinViewRoute);
                                                  },
                                                  child: NormalTextWidget(text: "Already have an account? SignIn")),
                          ],
                        )),
                    
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
