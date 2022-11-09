part of 'th_sort_header.dart';

class TopSort extends StatelessWidget {
  const TopSort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 11, 16, 11),
          child: DropdownButton(
            isExpanded: true,
            style: AppStyles.s35w400,
            value: 1,
            items: const [
              DropdownMenuItem(value: 1, child: Text('Crypto')),
              DropdownMenuItem(value: 2, child: Text('Crypto')),
              DropdownMenuItem(value: 3, child: Text('Crypto')),
            ],
            onChanged: (value) {},
            borderRadius: BorderRadius.circular(16),
            dropdownColor: Colors.black,
            underline: const SizedBox.shrink(),
            icon: Image.asset(AppAssets.images.arrowDown),
          ),
        ),
      ),
    );
  }
}
