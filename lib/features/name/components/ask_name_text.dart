import 'package:flutter/material.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class AskNameText extends StatelessWidget {
  const AskNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Як до вас звертатися?', style: AppTextStyles.title),
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            "Будь ласка, укажіть ваше ім'я для персоналізації сервісу.",
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle
          ),
        ),
      ],
    );
  }
}
