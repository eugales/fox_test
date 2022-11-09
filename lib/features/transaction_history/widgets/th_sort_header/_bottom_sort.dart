part of 'th_sort_header.dart';

class BottomSort extends StatelessWidget {
  const BottomSort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: DropdownButton(
          isExpanded: true,
          style: AppStyles.s16w400,
          value: 1,
          items: const [
            DropdownMenuItem(value: 1, child: Text('Crypto Sells')),
            DropdownMenuItem(value: 2, child: Text('Crypto Sells')),
            DropdownMenuItem(value: 3, child: Text('Crypto Sells')),
          ],
          onChanged: (value) {},
          borderRadius: BorderRadius.circular(16),
          dropdownColor: Colors.black,
          underline: const SizedBox.shrink(),
          icon: Image.asset(AppAssets.images.arrowDown),
        ),
      ),
    );
  }
}

