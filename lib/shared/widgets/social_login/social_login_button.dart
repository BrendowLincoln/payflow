import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {

  final String socialMediaName;
  final String socialMediaLogo;
  final VoidCallback onTap;

  SocialLoginButton({required this.socialMediaName, required this.socialMediaLogo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.shape,
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.stroke
            )
          )
        ),
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(socialMediaLogo),
                Container(
                  height: 56,
                  width: 1,
                  color: AppColors.stroke,
                ),
              ],
            ),),
            Expanded(child: SizedBox(width: 10,)),
            Expanded(
              flex: 4,
              child: Text(
                'Entrar com $socialMediaName',
                style: AppTextStyles.buttonGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
