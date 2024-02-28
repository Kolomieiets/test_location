import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_location/common/widget/app_button.dart';
import 'package:test_location/features/location/location_screen.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';
import 'package:test_location/features/name/components/app_text_field.dart';
import 'package:test_location/features/name/components/ask_name_text.dart';
import 'package:test_location/resources/style/app_colors.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LocationScreenProvider provider =
        Provider.of<LocationScreenProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.main,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AskNameText(),
            const SizedBox(height: 28.0),
            AppTextField(
              controller: controller,
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 20.0,
        ),
        child: AppButton(
          child: const Text(
            'Продовжити',
            style: AppTextStyles.button,
          ),
          onTap: () async {
            await provider
                .checkConnection();
            await provider
                .getGeolocation();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LocationScreen(name: controller.text)),
            );
          },
        ),
      ),
    );
  }
}
