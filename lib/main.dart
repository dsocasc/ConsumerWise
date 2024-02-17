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

import 'package:consumer_wise/src/components/line_chart.dart';
import 'package:consumer_wise/src/data/data.dart';
import 'package:consumer_wise/src/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  realizarSolicitud();
  runApp(MyApp());
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DayConsumptionPage(selectedDay),
          ),
        );
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
    );
  }
}

class DayConsumptionPage extends StatelessWidget {
  final DateTime selectedDay;

  DayConsumptionPage(this.selectedDay);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Consumo del ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}'),
      ),
      body: Center(
        child: Center(
          child: MyLineChart(chartData),
        ),
      ),
    );
  }
}

Future<void> realizarSolicitud() async {
  final url = 'http://localhost:8000/consumo-diario';
  DateTime fechaConsulta = DateTime(2021, 8, 3);

  try {
    var response = await http.post(
      Uri.parse(url),
      body: {'fecha_consulta': fechaConsulta.toIso8601String()},
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      initialRoute: 'inicio',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        'inicio': (BuildContext context) => LoginPage(),
      },
    );
  }
}
