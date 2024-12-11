import 'package:flutter/material.dart';

class EcoDropdownMenu extends StatefulWidget {
  final Future<List<String>> Function() loadItems;
  final String? initialSelection;
  final Function(String?) onChanged;
  final Function()? onAddCustomer;
  final String? topText;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const EcoDropdownMenu({
    super.key,
    required this.loadItems,
    this.initialSelection,
    required this.onChanged,
    this.onAddCustomer,
    this.topText,
    this.padding,
    this.width
  });

  @override
  _EcoDropdownMenuState createState() => _EcoDropdownMenuState();
}

class _EcoDropdownMenuState extends State<EcoDropdownMenu> {
  List<DropdownMenuEntry<String>> _items = [];
  bool _isLoading = false;
  bool _isVisible = false;
  final _dropdownController = SearchController();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() {
      _isLoading = true;
      _isVisible = false;
    });

    try {
      final rawItems = await widget.loadItems();

      // If list is null or empty, do not show dropdown
      if (rawItems.isEmpty) {
        setState(() {
          _items = [];
          _isLoading = false;
          _isVisible = false;
        });
        return;
      }

      // Combine items with loaded items
      final loadedItems = rawItems.map((item) =>
          DropdownMenuEntry<String>(value: item, label: item)
      ).toList();

      setState(() {
        _items = loadedItems;
        _isLoading = false;
        _isVisible = true;
      });

    } catch (e) {
      setState(() {
        _items = [];
        _isLoading = false;
        _isVisible = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading items: $e'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.topText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                widget.topText!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          DropdownMenu<String>(
            controller: _dropdownController,
            width: widget.width ?? MediaQuery.sizeOf(context).width * 0.9,
            onSelected: (String? selected) {
              // If no selection is made, do nothing
              if (selected == null) return;
              // Normal selection handling
              widget.onChanged(selected);
            },
            leadingIcon: widget.onAddCustomer != null ? IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                // Close dropdown and trigger add customer
                // _dropdownController.close();
                widget.onAddCustomer!();
              },
            ) : SizedBox.shrink(),
            dropdownMenuEntries: [
              if (_isLoading)
                DropdownMenuEntry(
                    value: 'loading',
                    label: 'Loading...',
                    enabled: false,
                    leadingIcon: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        )
                    )
                )
              else
                ..._items,
            ],
            menuStyle: MenuStyle(
              backgroundColor: MaterialStateProperty.all(colorScheme.background),
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: colorScheme.surface,
                        width: 2
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: colorScheme.surface,
                        width: 2
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorScheme.secondary,
                        width: 2
                    )
                ),
                fillColor: colorScheme.surface
            ),
          )
        ],
      ),
    );
  }
}