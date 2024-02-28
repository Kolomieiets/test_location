import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';
import 'package:test_location/resources/style/app_colors.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class NoLocationCard extends StatelessWidget {
  final VoidCallback refresh;
  const NoLocationCard({required this.refresh, super.key});

  @override
  Widget build(BuildContext context) {
    final LocationScreenProvider provider =
        Provider.of<LocationScreenProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 25.0,
      ),
      child: SizedBox(
        height: 304.0,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          Image.asset('assets/images/noLocation.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 65.0,
                  width: 65.0,
                  decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child: Image.asset('assets/icons/noWifi.png'),
                ),
                const SizedBox(height: 20.0),
                const Text('Відсутній звʼязок', style: AppTextStyles.title),
                const SizedBox(height: 20.0),
                const Text(
                  'Відсутність доступу до геолокації. Переконайтеся, що у додатку увімкнено геолокацію та перевірте зʼєднання з Інтернетом.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () async {
                    bool permitted = await Provider.of<LocationScreenProvider>(
                            context,
                            listen: false)
                        .isPermissionOk();
                    if (permitted) {
                      provider
                          .isAllowed = true;
                      await provider
                          .getGeolocation();
                      refresh();
                    }
                  },
                  child: const Text(
                    'Налаштування геолокації >',
                    style: AppTextStyles.textButton,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
