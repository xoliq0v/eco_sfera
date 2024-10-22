import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../utils/bloc/connectivity/connectivity_cubit.dart';

class NoInternetDialog {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false, // Prevent dismissing by tapping outside
      barrierColor: Theme.of(context).colorScheme.surface.withOpacity(0.85),
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  color: Theme.of(context).colorScheme.error,
                  size: 130,
                ),
                const Gap(20),
                Text(
                  'No Internet Connection',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                Text(
                  'Please check your connection and try again.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void monitorConnection(BuildContext context) {
    // Listen to the ConnectivityBloc's state changes
    context.read<ConnectivityBloc>().stream.listen((state) {
      if (state.status == ConnectivityStatus.disconnected) {
        show(context);
      } else if (state.status == ConnectivityStatus.connected) {
        hide(context);
      }
    });
  }
}
