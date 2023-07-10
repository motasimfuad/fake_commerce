part of '../pages/products_list_page.dart';

class _ProductsSortAndLimit extends StatelessWidget {
  const _ProductsSortAndLimit({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LimitButton(ref: ref),
          _SortingButton(ref: ref),
        ],
      ),
    );
  }
}

class _SortingButton extends StatelessWidget {
  const _SortingButton({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.sort_rounded,
          size: 18,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 5),
        DropdownButton<ProductSorting>(
          value: ref.read(productsSortingProvider),
          onChanged: (value) {
            ref.read(productsSortingProvider.notifier).state = value!;
          },
          underline: Container(),
          items: ProductSorting.values
              .map((e) => DropdownMenuItem<ProductSorting>(
                    value: e,
                    child: Text(e.name.toString()),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _LimitButton extends StatelessWidget {
  const _LimitButton({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.account_tree_rounded,
          size: 18,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 5),
        DropdownButton<int>(
          value: ref.read(productsLimitProvider),
          onChanged: (value) {
            ref.read(productsLimitProvider.notifier).state = value!;
          },
          underline: Container(),
          items: const [
            DropdownMenuItem(
              value: 5,
              child: Text('5'),
            ),
            DropdownMenuItem(
              value: 10,
              child: Text('10'),
            ),
            DropdownMenuItem(
              value: 15,
              child: Text('15'),
            ),
            DropdownMenuItem(
              value: 20,
              child: Text('20'),
            ),
          ],
        ),
      ],
    );
  }
}
