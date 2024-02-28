import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';
import 'package:test_location/resources/style/app_colors.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  const AppButton({required this.child, required this.onTap, super.key});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isTapped = true;
        widget.onTap();
        setState(() {});
      },
      child: Container(
        height: 47.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Provider.of<LocationScreenProvider>(context).isLoading
            ? const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.0,
                ),
              )
            : widget.child,
      ),
    );
  }
}
