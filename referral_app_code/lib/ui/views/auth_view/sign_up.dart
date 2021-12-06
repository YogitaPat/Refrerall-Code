import 'package:flutter/material.dart';
import 'package:referral_app_code/ui/route/route_generator.dart';
import 'package:referral_app_code/ui/views/home_view/home_view.dart';
import 'package:referral_app_code/ui/views/widgets/text_fields.dart';



class SignUpView extends StatelessWidget {
  static const String routeName = '/signUp';
  final String? referrarCode;
  SignUpView({Key? key, this.referrarCode}) : super(key: key);

  final TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    referralCodeController.text = referrarCode ?? '';
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),  automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                title: 'Email',
              ),
              SizedBox(height: 10),
              AppTextField(
                title: 'Password',
              ),
              SizedBox(height: 10),
              AppTextField(
                title: 'ReferralCode',
                controller: referralCodeController,
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('SignUp'),
                onPressed: () {
                  GeneratedRoute.navigateTo(HomeView.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
