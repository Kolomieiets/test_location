import 'package:flutter/material.dart';
import 'package:test_location/resources/style/app_colors.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class InfoCard extends StatelessWidget {
  final String name;
  const InfoCard({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22.0),
      decoration: const BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Stack(children: [
        Image.asset('assets/images/hero.png'),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Привіт,',
                style: TextStyle(
                    color: AppColors.white,
                    fontFamily: 'RFDewi',
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                name,
                style: const TextStyle(
                    color: AppColors.white,
                    fontFamily: 'RFDewi',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Додавання авто',
                style: TextStyle(
                    color: AppColors.white.withOpacity(0.6),
                    fontFamily: 'RFDewi',
                    fontSize: 8,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10.0),
              const SizedBox(
                width: 200,
                child: Text(
                  'Завантажте дані про ваше авто для кращого використання сервісу',
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'RFDewi',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 26.0),
              const InkWell(
                child: Text(
                  'Додати авто >',
                  style: AppTextStyles.textButton,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
