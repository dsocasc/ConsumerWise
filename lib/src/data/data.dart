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

import 'package:collection/collection.dart';

class ChartData {
  final double x;
  final double y;
  ChartData({required this.x, required this.y});
}

List<ChartData> get chartData {
  final data = <double>[
    0.1,
    0.073,
    0.083,
    0.073,
    0.078,
    0.077,
    0.076,
    0.0479,
    0.214,
    0.2,
    0.211,
    0.182,
    0.228,
    0.151,
    0.192,
    0.194,
    0.221,
    0.327,
    0.341,
    0.233,
    0.237,
    0.274,
    0.216
  ];
  return data
      .mapIndexed(
          (index, element) => ChartData(x: index.toDouble(), y: element))
      .toList();
}

List<ChartData> get chartData2 {
  return List.generate(
      5, (index) => ChartData(x: index.toDouble(), y: (index + 1) * 10.0));
}
