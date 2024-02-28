import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';
import 'package:test_location/resources/style/app_colors.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class NoLocationCard extends StatefulWidget {
  final VoidCallback refresh;
  const NoLocationCard({required this.refresh, super.key});

  @override
  State<NoLocationCard> createState() => _NoLocationCardState();
}

class _NoLocationCardState extends State<NoLocationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 25.0,
      ),
      child: SizedBox(
        height: 304,
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
                      Provider.of<LocationScreenProvider>(context,
                              listen: false)
                          .isAllowed = true;
                      await Provider.of<LocationScreenProvider>(context,
                              listen: false)
                          .getGeolocation();
                      widget.refresh();
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
