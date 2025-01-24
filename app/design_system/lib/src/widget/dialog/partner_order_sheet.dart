import 'package:audioplayers/audioplayers.dart';
import 'package:core/core.dart';
import '../../../design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:navigation/navigation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:core/core.dart';
import '../../../design_system.dart';

class PartnerOrderSheet {
  static Future<void> show({
    required BuildContext context,
    required PartnerOrder order,
    required bool isNewOrder,
    required Function() onAcceptPress
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => PartnerOrderSheetContent(
          order: order,
          scrollController: scrollController,
          isNewOrder: isNewOrder,
          onAcceptPress: onAcceptPress,
        ),
      ),
    );
  }
}

class PartnerOrderSheetContent extends StatefulWidget {
  final PartnerOrder order;
  final ScrollController scrollController;
  final bool isNewOrder;
  final Function() onAcceptPress;

  const PartnerOrderSheetContent({
    super.key,
    required this.order,
    required this.scrollController,
    required this.isNewOrder,
    required this.onAcceptPress,
  });

  @override
  State<PartnerOrderSheetContent> createState() => _PartnerOrderSheetContentState();
}

class _PartnerOrderSheetContentState extends State<PartnerOrderSheetContent> {
  bool _isPlaying = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _stopAudio() async {
    if (_isPlaying) {
      setState(() => _isPlaying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDragHandle(),
          Expanded(
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: [
                _buildHeader(context),
                // _buildOrderItems(context),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PInfoBox(
                      icon: AppIcons.box,
                      title: LocaleKeys.trash.tr(context: context),
                      value: widget.order.productType.toString().tr(context: context),
                    ),
                    PInfoBox(
                      icon: AppIcons.weight,
                      title: LocaleKeys.trash.tr(context: context),
                      value: widget.order.productWeight.toString(),
                    ),
                  ],
                ).toBoxAdapter(),
                _buildFooter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text(
            '44 km · 12 min',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${widget.order.driver.name}  ${(widget.order.driver.phoneNumber??'').formatUzbekPhoneNumber()}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }

  // Widget _buildOrderItems(BuildContext context) {
  //   return SliverPadding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     sliver: SliverList(
  //       delegate: SliverChildBuilderDelegate(
  //             (context, index) => Padding(
  //           padding: const EdgeInsets.only(bottom: 16),
  //           child: OrderItemTile(item: widget.order.items![index]),
  //         ),
  //         childCount: widget.order.items?.length ?? 0,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildFooter(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            // ExpandableText(
            //   // text: widget.order.description ?? '',
            //   // maxLines: 3,
            // ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: EcoMaterialButton(
                    color: Theme.of(context).colorScheme.surface,
                    onPressed: () async {
                      await _stopAudio();
                      Navigator.pop(context);
                    },
                    child: Text(LocaleKeys.cancel.tr(context: context)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: EcoElevatedButton.loading(
                    maxHeight: 80,
                    minHeight: 75,
                    loading: isLoading,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await widget.onAcceptPress.call();
                      await _stopAudio();
                      context.router.popForced();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Text(LocaleKeys.acceptance.tr(context: context)),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}

class PInfoBox extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const PInfoBox({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}