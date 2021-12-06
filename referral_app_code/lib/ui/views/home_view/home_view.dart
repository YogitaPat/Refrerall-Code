import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referral_app_code/ui/views/home_view/widget/create_referral_code.dart';
import 'package:referral_app_code/view_models/home_view_model.dart';


class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Referral Assignment')),
      body: Consumer<HomeViewModel>(
        builder: (_, model, child) => CreateReferralCode(
          (String referralCode) {
            model.deeplinkApi.createReferralLink(referralCode);
            return Center(
              child:

              Text('Home Screen'),
            );
          },
        ),
      ),
    );
  }
}
