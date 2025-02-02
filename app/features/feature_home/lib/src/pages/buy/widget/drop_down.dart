
import 'package:core/core.dart';
import 'package:flutter/material.dart';


class CustomDropDown extends StatefulWidget {
  final List<String>? items;
  final bool isLoading;
  final String? initialSelection;
  final Function(String?)? onChanged;
  final Function()? onAddCustomer;
  final String? topText;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final String? placeholderText;
  final Function()? onLoadMore;
  final bool? isLast;
  final bool? readOnly;

  const CustomDropDown({
    super.key,
    this.items,
    this.isLoading = false,
    this.initialSelection,
    this.onChanged,
    this.onAddCustomer,
    this.topText,
    this.padding,
    this.width,
    this.placeholderText,
    this.onLoadMore,
    this.isLast,
    this.readOnly,
  });

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  String? _selectedValue;
  bool _isLoadingMore = false;
  bool _isLastPage = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;
  final GlobalKey _key = GlobalKey();
  List<String>? _currentItems;
  final TextEditingController _searchController = TextEditingController();
  List<String>? _filteredItems;
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialSelection;
    _currentItems = widget.items;
    _filteredItems = widget.items;
    _isLastPage = widget.isLast ?? false;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    if (_currentItems == null) return;

    final searchText = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _currentItems!
          .where((item) => item.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  void didUpdateWidget(CustomDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_isLoadingMore && widget.items != oldWidget.items) {
      if (!_isMenuOpen) {
        _currentItems = widget.items?.toList() ?? [];
        _filterItems(); // Reapply current search filter
      } else {
        final newItems = widget.items ?? [];
        if (newItems.length > _currentItems!.length) {
          final itemsToAdd = newItems.skip(_currentItems!.length).toList();
          _currentItems!.addAll(itemsToAdd);
          _filterItems(); // Reapply current search filter
        }
      }
    }

    if (widget.initialSelection != oldWidget.initialSelection) {
      setState(() {
        _selectedValue = widget.initialSelection;
      });
    }

    if (widget.isLast != oldWidget.isLast) {
      _isLastPage = widget.isLast ?? false;
    }
  }

  // @override
  // void didUpdateWidget(CustomDropDown oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //
  //   // Only update items if they've changed and we're not in the middle of loading more
  //   if (!_isLoadingMore && widget.items != oldWidget.items) {
  //     if (!_isMenuOpen) {
  //       // If menu is closed, replace the entire list
  //       _currentItems = widget.items?.toList() ?? [];
  //     } else {
  //       // If menu is open and we're not loading more, check if we need to update
  //       final newItems = widget.items ?? [];
  //       if (newItems.length > _currentItems!.length) {
  //         // Only append new items that aren't already in the list
  //         final itemsToAdd = newItems.skip(_currentItems!.length).toList();
  //         _currentItems!.addAll(itemsToAdd);
  //       }
  //     }
  //   }
  //
  //   if (widget.initialSelection != oldWidget.initialSelection) {
  //     setState(() {
  //       _selectedValue = widget.initialSelection;
  //     });
  //   }
  //
  //   if (widget.isLast != oldWidget.isLast) {
  //     _isLastPage = widget.isLast ?? false;
  //   }
  // }

  void _showMenu() {
    final RenderBox button = _key.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

    setState(() {
      _isMenuOpen = true;
      _currentItems = widget.items;
      _filteredItems = _currentItems;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _hideMenu,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: buttonPosition.dy + button.size.height,
            left: buttonPosition.dx,
            width: button.size.width,
            child: Material(
              color: Colors.transparent,
              child: StatefulBuilder(
                builder: (context, setState) => CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0, button.size.height),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.search.tr(context: context),
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            onChanged: (_) => setState(() {}), // Rebuild to show filtered items
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.isLoading)
                                  _buildLoadingItem()
                                else ...[
                                  if (widget.onAddCustomer != null)
                                    _buildAddCustomerItem(),
                                  ..._buildItems(setState),
                                  if (widget.onLoadMore != null && !_isLastPage)
                                    _buildLoadMoreItem(setState),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    // Focus the search field when the menu opens
    _searchFocusNode.requestFocus();
  }


  // void _showMenu() {
  //   final RenderBox button = _key.currentContext!.findRenderObject() as RenderBox;
  //   final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  //   final buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);
  //
  //   setState(() {
  //     _isMenuOpen = true;
  //     // Update items when opening menu
  //     _currentItems = widget.items;
  //   });
  //
  //   _overlayEntry = OverlayEntry(
  //     builder: (context) => Stack(
  //       children: [
  //         // Add invisible overlay to handle clicks outside menu
  //         Positioned.fill(
  //           child: GestureDetector(
  //             behavior: HitTestBehavior.opaque,
  //             onTap: _hideMenu,
  //             child: Container(color: Colors.transparent),
  //           ),
  //         ),
  //         Positioned(
  //           top: buttonPosition.dy + button.size.height,
  //           left: buttonPosition.dx,
  //           width: button.size.width,
  //           child: Material(
  //             color: Colors.transparent,
  //             child: StatefulBuilder(
  //               builder: (context, setState) => CompositedTransformFollower(
  //                 link: _layerLink,
  //                 showWhenUnlinked: false,
  //                 offset: Offset(0, button.size.height),
  //                 child: Container(
  //                   constraints: BoxConstraints(
  //                     maxHeight: MediaQuery.of(context).size.height * 0.4,
  //                   ),
  //                   decoration: BoxDecoration(
  //                     color: Theme.of(context).colorScheme.surface,
  //                     borderRadius: BorderRadius.circular(8),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.black.withOpacity(0.1),
  //                         blurRadius: 8,
  //                         spreadRadius: 1,
  //                       ),
  //                     ],
  //                   ),
  //                   child: SingleChildScrollView(
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         if (widget.isLoading)
  //                           _buildLoadingItem()
  //                         else ...[
  //                           if (widget.onAddCustomer != null)
  //                             _buildAddCustomerItem(),
  //                           ..._buildItems(setState),
  //                           if (widget.onLoadMore != null && !_isLastPage)
  //                             _buildLoadMoreItem(setState),
  //                         ],
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   Overlay.of(context).insert(_overlayEntry!);
  // }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isMenuOpen = false;
      _isLoadingMore = false;
    });
  }


  Future<void> _handleLoadMore(StateSetter setState) async {
    if (_isLoadingMore || widget.onLoadMore == null) return;

    setState(() {
      _isLoadingMore = true;
    });

    await widget.onLoadMore!();

    if (mounted) {
      setState(() {
        _isLoadingMore = false;
        // Update current items with new items from widget
        if (widget.items != null) {
          final newItems = widget.items!;
          if (newItems.length > _currentItems!.length) {
            final itemsToAdd = newItems.skip(_currentItems!.length).toList();
            _currentItems!.addAll(itemsToAdd);
          }
        }
        _isLastPage = widget.isLast ?? false;
      });
    }
  }


  // List<Widget> _buildItems(StateSetter setState) {
  //   return _currentItems!.map((item) => ListTile(
  //     title: Text(item),
  //     selected: item == _selectedValue,
  //     onTap: () {
  //       this.setState(() {
  //         _selectedValue = item;
  //       });
  //       widget.onChanged?.call(item);
  //       _hideMenu();
  //     },
  //   )).toList();
  // }

  Widget _buildLoadingItem() {
    return ListTile(
      leading: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      ),
      title: Text(LocaleKeys.loading_more.tr(context: context), style: Theme.of(context).textTheme.bodyMedium),
      enabled: false,
    );
  }

  Widget _buildAddCustomerItem() {
    return ListTile(
      leading: const Icon(Icons.add_circle_outline),
      title: Text(LocaleKeys.addCustomer.tr(context: context)),
      onTap: () {
        _hideMenu();
        widget.onAddCustomer?.call();
      },
    );
  }

  Widget _buildLoadMoreItem(StateSetter setState) {
    return ListTile(
      leading: _isLoadingMore
          ? const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      )
          : const Icon(Icons.arrow_circle_down),
      title: Text(_isLoadingMore ? LocaleKeys.loading_more.tr(context: context) : LocaleKeys.load_more_customer.tr(context: context)),
      enabled: !_isLoadingMore,
      onTap: _isLoadingMore ? null : () async => await _handleLoadMore(setState),
    );
  }

  List<Widget> _buildItems(StateSetter setState) {
    final items = _filteredItems ?? [];
    if (items.isEmpty) {
      return [
        ListTile(
          title: Text(
            LocaleKeys.no_results_found.tr(context: context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ];
    }

    return items.map((item) => ListTile(
      title: Text(item),
      selected: item == _selectedValue,
      onTap: () {
        this.setState(() {
          _selectedValue = item;
        });
        widget.onChanged?.call(item);
        _hideMenu();
      },
    )).toList();
  }

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
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
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: widget.readOnly ?? false ? null : widget.onChanged == null ? null : () {
                if (_isMenuOpen) {
                  _hideMenu();
                } else {
                  _showMenu();
                }
              },
              child: Container(
                key: _key,
                width: widget.width ?? MediaQuery.sizeOf(context).width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _isMenuOpen
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.surface,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedValue ?? widget.placeholderText ?? '',
                        style: TextStyle(
                          color: _selectedValue == null
                              ? Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Icon(
                      _isMenuOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}