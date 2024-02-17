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

import 'package:consumer_wise/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                _imageBanner(),
                CalendarWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 80, bottom: 40),
      child: Image.asset(
        'assets/img/foco.jpg',
        width: 200,
        height: 180,
      ),
    );
  }
}
