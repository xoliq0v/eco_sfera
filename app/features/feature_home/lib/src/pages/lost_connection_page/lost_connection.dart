import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LostConnectionPage extends StatefulWidget {
  const LostConnectionPage({required this.onResult, super.key});

  final void Function(bool) onResult;

  @override
  State<LostConnectionPage> createState() => _LostConnectionPageState();
}

class _LostConnectionPageState extends State<LostConnectionPage> {
  final networkLock = Lock();
  final loading = ValueNotifier(false);

  @override
  void dispose() {
    loading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImage.asset(
                    AppIcons.disconnect,
                    width: 189.r,
                    height: 189.r,
                  ),
                  26.verticalSpace,
                  const Text(
                    'Отсутствует интернет соединение...',
                    style: AppTextConstants.style16W400,
                  ),
                ],
              ),
              const Spacer(),
              ValueListenableBuilder(
                valueListenable: loading,
                builder: (BuildContext context, bool value, Widget? child) {
                  return EcoElevatedButton.loading(
                    onPressed: retry.call,
                    loading: value,
                    maxHeight: 50.h,
                    child: const Text('Повторить попытку'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> retry() async {
    loading.value = true;
    await networkLock.synchronized(() async {
      if (!mounted) return;
      final value = await internetConnectionChecker.hasConnection;
      widget.onResult.call(value);
    });
    loading.value = false;
  }

  InternetConnectionChecker get internetConnectionChecker {
    return GetIt.I.get<InternetConnectionChecker>();
  }
}
