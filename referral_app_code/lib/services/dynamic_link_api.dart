

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:referral_app_code/ui/route/route_generator.dart';
import 'package:referral_app_code/ui/views/auth_view/sign_up.dart';

class DynamicLinksApi {
  final dynamicLink = FirebaseDynamicLinks.instance;

  handleDynamicLink() async {
    await dynamicLink.getInitialLink();
    dynamicLink.onLink(onSuccess: (PendingDynamicLinkData? data) async {
      handleSuccessLinking(data!);
    }, onError: (OnLinkErrorException error) async {
      print(error.message.toString());
    });
  }

  Future<String> createReferralLink(String referralCode) async {
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      uriPrefix: 'https://my.rapp.link/referrer',
      link: Uri.parse('https://my.rapp.link/referrer=$referralCode'),
      androidParameters: AndroidParameters(
        packageName: 'com.app.referral_code',
      ),

    );

    final ShortDynamicLink shortLink =
        await dynamicLinkParameters.buildShortLink();

    final Uri dynamicUrl = shortLink.shortUrl;
    print(dynamicUrl);
    return dynamicUrl.toString();
  }

  void handleSuccessLinking(PendingDynamicLinkData data) {
    final Uri deepLink = data.link;

    if (deepLink != null) {
      var isRefer = deepLink.pathSegments.contains('refer');
      if (isRefer) {
        var code = deepLink.queryParameters['code'];
        print(code.toString());
        if (code != null) {
          GeneratedRoute.navigateTo(
            SignUpView.routeName,
            args: code,
          );
        }
      }
    }
  }
}
