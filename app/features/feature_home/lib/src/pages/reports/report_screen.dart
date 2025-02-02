import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late Map<String, String> params;

  @override
  Widget build(BuildContext context) {
    params = <String, String>{
      LocaleKeys.loadCapacity.tr(context: context): "4 tona",
      LocaleKeys.numberOfVouchers.tr(context: context): "5",
      LocaleKeys.theSumTotalOfTickets.tr(context: context): "3,5m3",
      LocaleKeys.dailyWalkingDistance.tr(context: context): "60km",
    };

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.reports.tr(context: context)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('17-24 dek'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 50,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        // Weekday labels
                        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                        final index = value.toInt() % 7;
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[index],
                            style: const TextStyle(
                              color: Color(0xff68737d),
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 50, // Changed to show 50-unit intervals
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: Color(0xff68737d),
                            fontSize: 12,
                          ),
                        );
                      },
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 6, // Changed to show 7 days (0-6)
                minY: 0,
                maxY: 200, // Changed to max 200
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 120),
                      const FlSpot(1, 50),
                      const FlSpot(2, 200),
                      const FlSpot(3, 120),
                      const FlSpot(4, 0),
                      const FlSpot(5, 140),
                      const FlSpot(6, 130),
                    ],
                    isCurved: true,
                    color: context.colorScheme.secondary,
                    barWidth: 2,
                    dotData: const FlDotData(
                      show: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _Box(weight: 500)
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  final int weight;
  const _Box({required this.weight});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              ''
            ),
            Text(
              weight.toString(),
              style: TextStyle(
                color: context.colorScheme.secondary,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
