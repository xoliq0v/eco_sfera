import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AliceRawLogListWidget extends StatelessWidget {
  const AliceRawLogListWidget({
    super.key,
    required this.scrollController,
    required this.getRawLogs,
    required this.emptyWidget,
  });

  final ScrollController scrollController;
  final Future<String>? getRawLogs;
  final Widget emptyWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getRawLogs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.isNotEmpty == true) {
            return Scrollbar(
              thickness: 8,
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onLongPress: () =>
                        _copyToClipboard(snapshot.data!, context),
                    child: Text(
                      snapshot.data ?? '',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
            );
          }
          return emptyWidget;
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> _copyToClipboard(String text, BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied!'),
      ),
    );
  }
}
