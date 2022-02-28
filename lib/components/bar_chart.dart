import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/extensions/ext_color.dart';
import '../utils/extensions/ext_double.dart';

BarChartData barChartData() {
  final creditCardValue = RandomDouble.get();
  final carValue = RandomDouble.get();
  final petsValue = RandomDouble.get();
  final doctorsValue = RandomDouble.get();
  final othersValue = RandomDouble.get();

  return BarChartData(
    maxY: 20,
    barTouchData: BarTouchData(
      enabled: true,
    ),
    titlesData: FlTitlesData(
        show: true,
        topTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          margin: 20,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'R\$ $creditCardValue';
              case 1:
                return 'R\$ $carValue';
              case 2:
                return 'R\$ $petsValue';
              case 3:
                return 'R\$ $doctorsValue';
              case 4:
                return 'R\$ $othersValue';
              default:
                return '';
            }
          },
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          margin: 8,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Cartão \nde Crédito';
              case 1:
                return 'Carro';
              case 2:
                return 'Pets';
              case 3:
                return 'Consulta\nMédica';
              case 4:
                return 'Outros';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
        rightTitles: SideTitles(
          showTitles: false,
        )),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: List.generate(5, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, creditCardValue, Colors.black);
        case 1:
          return makeGroupData(1, carValue, Colors.black);
        case 2:
          return makeGroupData(2, petsValue, Colors.black);
        case 3:
          return makeGroupData(3, doctorsValue, Colors.black);
        case 4:
          return makeGroupData(4, othersValue, Colors.black);
        default:
          return throw Error();
      }
    }),
    gridData: FlGridData(show: false),
  );
}

BarChartGroupData makeGroupData(
  int x,
  double y,
  Color barColor,
) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        y: y,
        colors: [barColor],
        width: 22,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: 15,
          colors: [Colors.white],
        ),
      ),
    ],
    showingTooltipIndicators: [],
  );
}
