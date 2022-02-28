import 'package:financeapp/utils/extensions/ext_color.dart';
import 'package:financeapp/utils/extensions/ext_double.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



  PieChart pieChart() {

    final creditCardValue = RandomDouble.get();
    final carValue = RandomDouble.get();
    final petsValue = RandomDouble.get();
    final doctorsValue = RandomDouble.get();
    final othersValue = RandomDouble.get();

    const textStyle = TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13);

    final List<PieChartSectionData> listPie = [
      // PieChartSectionData(
      //   color: RandomColor.get(),
      //   value: creditCardValue,
      //   showTitle: true,
      //   title: "Cartão \nde Crédito\n R\$ $creditCardValue",
      //   titleStyle: textStyle, 

      // ),
      // PieChartSectionData(
      //   color: RandomColor.get(),
      //   value: carValue,
      //   showTitle: true,
      //   title: "Carro\n R\$ $carValue",
      //   titleStyle: textStyle, 

      // ),
      // PieChartSectionData(
      //   color: RandomColor.get(),
      //   value: petsValue,
      //   showTitle: true,
      //   title: "Pets\n R\$ $petsValue",
      //   titleStyle: textStyle, 

      // ),
      // PieChartSectionData(
      //   color: RandomColor.get(),
      //   value: doctorsValue,
      //   showTitle: true,
      //   title: "Consulta Médica\n R\$ $doctorsValue",
      //   titleStyle: textStyle, 

      // ),
      // PieChartSectionData(
      //   color: RandomColor.get(),
      //   value: othersValue,
      //   showTitle: true,
      //   title: "Outros\n R\$ $othersValue",
      //   titleStyle: textStyle, 

      // ),
    ];

    return PieChart(
      PieChartData(sections: listPie),
    );
  }
