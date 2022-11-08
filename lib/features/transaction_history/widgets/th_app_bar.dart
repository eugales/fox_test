import 'package:flutter/material.dart';
import 'package:test_app/constants/app_assets.dart';
import 'package:test_app/constants/app_styles.dart';

class THAppBar extends StatelessWidget {
  const THAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: const Color(0xFF18181C),
      title: Text(
        'Transaction History',
        style: AppStyles.s16w400.copyWith(color: Colors.white),
      ),
      centerTitle: false,
      titleSpacing: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Image.asset(AppAssets.images.arrowBack),
      ),
    );
  }
}
