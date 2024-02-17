/*
 * ConsumerWise.
 *
 * Diego Socas
 * Rodrich Antaya
 * Brais Varela
 *
 * Se renuncia a los derechos de autor de este archivo y se libera al dominio público
 * bajo la licencia CC0 1.0 Universal. Para más información, vea el archivo LICENSE
 * en la raíz del proyecto o https://creativecommons.org/publicdomain/zero/1.0/
 */

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class MyLineChart extends StatelessWidget {
  final List<ChartData> points;
  const MyLineChart(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
            barWidth: 5,
            spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
            dotData: FlDotData(show: true)),
      ])),
    );
  }
}
