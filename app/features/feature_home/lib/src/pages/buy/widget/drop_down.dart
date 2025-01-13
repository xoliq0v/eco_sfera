
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

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialSelection;
    _currentItems = widget.items;
    _isLastPage = widget.isLast ?? false;
  }

  @override
  void didUpdateWidget(CustomDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update items if they've changed while menu is closed
    if (!_isMenuOpen && widget.items != oldWidget.items) {
      _currentItems = widget.items;
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

  void _showMenu() {
    final RenderBox button = _key.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

    setState(() {
      _isMenuOpen = true;
      // Update items when opening menu
      _currentItems = widget.items;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Add invisible overlay to handle clicks outside menu
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
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isMenuOpen = false;
      _isLoadingMore = false;
    });
  }

  Widget _buildLoadingItem() {
    return ListTile(
      leading: const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      ),
      title: Text('Loading...', style: Theme.of(context).textTheme.bodyMedium),
      enabled: false,
    );
  }

  Widget _buildAddCustomerItem() {
    return ListTile(
      leading: const Icon(Icons.add_circle_outline),
      title: const Text('Add customer'),
      onTap: () {
        _hideMenu();
        widget.onAddCustomer?.call();
      },
    );
  }

  List<Widget> _buildItems(StateSetter setState) {
    return _currentItems?.map((item) => ListTile(
      title: Text(item),
      selected: item == _selectedValue,
      onTap: () {
        this.setState(() {
          _selectedValue = item;
        });
        widget.onChanged?.call(item);
        _hideMenu();
      },
    )).toList() ?? [];
  }

  Widget _buildLoadMoreItem(StateSetter setState) {
    return ListTile(
      leading: _isLoadingMore
          ? const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      )
          : const Icon(Icons.more_horiz),
      title: Text(_isLoadingMore ? 'Loading more...' : 'Load more'),
      enabled: !_isLoadingMore,
      onTap: _isLoadingMore ? null : () => _handleLoadMore(setState),
    );
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
        _currentItems = widget.items;
        _isLastPage = widget.isLast ?? false;
      });
    }
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