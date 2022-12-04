import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../shared/views/widgets/app_button.dart';
import '../../../shared/views/widgets/app_input.dart';
import '../../../shared/views/widgets/app_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  _headerBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _inputsBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _buttonBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _otherOptionsTitleBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _otherOptionsBuilder(),
                  const SizedBox(
                    height: 72.0,
                  ),
                  _notAMemberBuilder(context),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Column(
      children: [
        AppText.heading1(
          'Register',
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 28.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        const AppText.heading4(
          "Thanks, we are glad to\nhave you onboard",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _inputsBuilder() {
    return Column(
      children: const [
        AppInput(
          hintText: 'Email address',
          requiredPadding: false,
        ),
        SizedBox(
          height: 15.0,
        ),
        AppInput(
          hintText: 'Password',
          password: true,
          requiredPadding: false,
        ),
        SizedBox(
          height: 15.0,
        ),
        AppInput(
          hintText: 'Confirm Password',
          password: true,
          requiredPadding: false,
        ),
      ],
    );
  }

  Widget _buttonBuilder() {
    return AppButton.filled(
      value: 'Sign Up',
      minWidth: double.infinity,
      padding: const EdgeInsets.all(18.0),
      borderRadius: 15.0,
      loaderSize: 20.0,
      loading: false,
      onPressed: () {},
    );
  }

  Widget _otherOptionsTitleBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              thickness: 1.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          AppText.body(
            'or continue with',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Divider(
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherOptionsBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: AppButton.bordered(
              icon: CachedNetworkImage(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                width: 20.0,
                height: 20.0,
              ),
              borderRadius: 15.0,
              borderColor: kcLightGrey,
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: AppButton.bordered(
              icon: CachedNetworkImage(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/1365px-Facebook_f_logo_%282019%29.svg.png',
                width: 20.0,
                height: 20.0,
              ),
              borderRadius: 15.0,
              borderColor: kcLightGrey,
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _notAMemberBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppText.body(
          'Already a member?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        AppText.body(
          ' Login now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
