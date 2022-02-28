import 'package:financeapp/utils/extensions/ext_card.dart';
import 'package:financeapp/utils/extensions/ext_color.dart';
import 'package:financeapp/utils/extensions/ext_double.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget pieChart2(BuildContext context, double height, double width) {
  const creditCard = "Cartão \nde Crédito";
  const car = "Carro";
  const pets = "Pets";
  const doctors = "Consulta \nMédica";
  const others = "Outros";

  final creditCardValue = RandomDouble.get();
  final carValue = RandomDouble.get();
  final petsValue = RandomDouble.get();
  final doctorsValue = RandomDouble.get();
  final othersValue = RandomDouble.get();

  final listColors = RandomColor.get(max: 5);

  final creditCardColor = listColors[0];
  final carColor = listColors[1];
  final petsColor = listColors[2];
  final doctorsColor = listColors[3];
  final othersColor = listColors[4];

  const double radiusOfPie = 80;

  const textStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13);

  final List<PieChartSectionData> listPie = [
    PieChartSectionData(
      color: creditCardColor,
      value: creditCardValue,
      showTitle: true,
      title: "$creditCard\n R\$ $creditCardValue",
      titleStyle: textStyle,
      radius: radiusOfPie,
    ),
    PieChartSectionData(
      color: carColor,
      value: carValue,
      showTitle: true,
      title: "$car\n R\$ $carValue",
      titleStyle: textStyle,
      radius: radiusOfPie,
    ),
    PieChartSectionData(
      color: petsColor,
      value: petsValue,
      showTitle: true,
      title: "$pets\n R\$ $petsValue",
      titleStyle: textStyle,
      radius: radiusOfPie,
    ),
    PieChartSectionData(
      color: doctorsColor,
      value: doctorsValue,
      showTitle: true,
      title: "$doctors\n R\$ $doctorsValue",
      titleStyle: textStyle,
      radius: radiusOfPie,
    ),
    PieChartSectionData(
      color: othersColor,
      value: othersValue,
      showTitle: true,
      title: "$others\n R\$ $othersValue",
      titleStyle: textStyle,
      radius: radiusOfPie,
    ),
  ];

  return RoundedCard.get(
    context,
    height,
    child: Column(
      children: [
        Expanded(
          child: AspectRatio(aspectRatio: 1, child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: PieChart(PieChartData(sections: listPie)),
          ),)
        ),
      ],
    ),
  );
}
