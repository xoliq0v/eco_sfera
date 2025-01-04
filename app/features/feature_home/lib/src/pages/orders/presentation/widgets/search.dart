part of '../orders_page.dart';

class _OrderSearch extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;
  const _OrderSearch({super.key,required this.searchController,required this.onChanged});

  @override
  State<_OrderSearch> createState() => _OrderSearchState();
}

class _OrderSearchState extends State<_OrderSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: widget.searchController,
              // hintText: LocaleKeys.name.tr(context: context),
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              FilterSheet.show(context);
            },
            icon: SvgPicture.asset(AppIcons.filter),
          ),
        ],
      ),
    );
  }
}
