part of '../../../partners_page.dart';

class _SearchField extends StatelessWidget {
  const _SearchField({
    super.key,
    required this.controller
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return EcoTextField(
      controller: controller,
    );
  }
}
