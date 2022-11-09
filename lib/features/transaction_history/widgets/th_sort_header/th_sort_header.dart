import 'package:flutter/material.dart';
import 'package:test_app/constants/app_assets.dart';
import 'package:test_app/constants/app_styles.dart';
import 'package:test_app/features/transaction_history/widgets/th_header_delegate.dart';

part '_top_sort.dart';
part '_bottom_sort.dart';

class THSortHeader extends StatelessWidget {
  const THSortHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: THHeaderDelegate(
        minHeight: 150,
        maxHeight: 150,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFF18181C),
          ),
          child: Column(
            children: [
              const TopSort(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  children: [
                    const Flexible(child: BottomSort()),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fixedSize: const Size(48, 48),
                        side: const BorderSide(color: Colors.white24),
                      ),
                      child: Image.asset(AppAssets.images.calendar),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



