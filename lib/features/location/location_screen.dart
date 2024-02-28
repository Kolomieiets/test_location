import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_location/common/widget/app_button.dart';
import 'package:test_location/features/location/components/info_card.dart';
import 'package:test_location/features/location/components/location_card.dart';
import 'package:test_location/features/location/components/no_location_card.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';
import 'package:test_location/resources/style/app_colors.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class LocationScreen extends StatefulWidget {
  final String name;
  const LocationScreen({required this.name, super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.accent,
        title: const Text(
          'logo',
          style: TextStyle(
            color: AppColors.white,
            fontFamily: 'SF',
            fontSize: 15,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/PhoneIcon.png'),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InfoCard(
              name: widget.name,
            ),
            Provider.of<LocationScreenProvider>(context).isConnected && Provider.of<LocationScreenProvider>(context).isAllowed
                ? const LocationCard()
                : NoLocationCard(refresh: () => setState(() {})),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: AppButton(
                  child: const Text(
                    'Викликати майстра',
                    style: AppTextStyles.button,
                  ),
                  onTap: () {}),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        useLegacyColorScheme: false,
        unselectedLabelStyle: AppTextStyles.bottomBarLabelInactive,
        selectedLabelStyle: AppTextStyles.bottomBarLabelActive,
        items: [
          item(
            icon: Image.asset('assets/icons/applications.png'),
            label: 'Заявки',
          ),
          item(
            icon: Image.asset('assets/icons/home.png'),
            label: 'Головна',
          ),
          item(
            icon: Image.asset('assets/icons/user.png'),
            label: 'Особисті дані',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem item({required String label, required Image icon}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: icon,
      ),
      label: label,
    );
  }
}
