import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample extends StatelessWidget {
  final Map<String, int> bookCategoryCounts;

  const BarChartSample({super.key, required this.bookCategoryCounts});

  @override
  Widget build(BuildContext context) {
    final categories = bookCategoryCounts.keys.toList();
    final values = bookCategoryCounts.values.toList();

    return AspectRatio(
      aspectRatio: 1.2,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: (values.reduce((a, b) => a > b ? a : b)).toDouble() + 1,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, interval: 1),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < categories.length) {
                    return Text(
                      categories[index],
                      style: const TextStyle(fontSize: 10),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(categories.length, (index) {
            return BarChartGroupData(x: index, barRods: [
              BarChartRodData(
                toY: values[index].toDouble(),
                width: 20,
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
