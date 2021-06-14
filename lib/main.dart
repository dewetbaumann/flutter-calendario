import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(CalendarMain());
}

class CalendarMain extends StatelessWidget {
  const CalendarMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarApp(),
    );
  }
}

class CalendarApp extends StatefulWidget {
  CalendarApp({Key key}) : super(key: key);

  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  CalendarController _controller;

  Container taskList(
      String title, String description, IconData iconImg, Color iconColor) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          //Icono de circulo con marca de okey
          Icon(
            iconImg,
            color: iconColor,
            size: 30,
          ),
          //Contenedor con el Texto principal
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                //Espaciado
                SizedBox(
                  height: 10,
                ),
                //Descripcion
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              //Muestro y configuro el calendario en pantalla
              TableCalendar(
                calendarController: _controller,
                availableCalendarFormats: {
                  //Solo mostrara el mes
                  CalendarFormat.month: 'Month',
                  //Solo mostrara el mes y la primera semana
                  //CalendarFormat.week: 'Weeks',
                  //Solo mostrara el mes y las primeras dos semanas
                  //CalendarFormat.twoWeeks: '2 Weeks',
                },
                //Aqui elijo el primer dia de la semana
                //Lunes en este caso
                startingDayOfWeek: StartingDayOfWeek.monday,
                //Aqui configuro los numeros del calendario
                calendarStyle: CalendarStyle(
                  renderDaysOfWeek: true,
                  renderSelectedFirst: false,
                  weekdayStyle: TextStyle(
                    color: Color(0xff30384C),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  weekendStyle: TextStyle(
                    color: Color(0xff30384C),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  selectedColor: Color(0xFF30374B),
                  todayColor: Color(0xFFCFC8B4),
                ),
                //Aqui configuro los dias de la semana
                //la parte superior del calendario
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      color: Color(0xFF30384C),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  weekendStyle: TextStyle(
                      color: Color(0xFF30384C),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                headerStyle: HeaderStyle(
                  //Oculta el boton de la semana, que esta arriba a la derecha
                  formatButtonVisible: false,
                  //Configuramos el estilo del mes
                  titleTextStyle: TextStyle(
                      color: Color(0xFF30384C),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  //Configura la fleca izq para cambiar los meses
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Color(0xFF30384C),
                  ),
                  //configura la fleca drc para cambiar los meses
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Color(0xFF30384C),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Color(0xFF30384C)),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Texto 'Hoy' en el contendor azul de abajo'
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            "Hoy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        taskList(
                          "Turno de las 10:30",
                          "Dr. Roberto Bolanioz, Pediatra",
                          CupertinoIcons.clock_solid,
                          Color(0xFFFF9E00),
                        ),

                        taskList(
                          "Mi turno a las 11:00",
                          "Dr. Roberto Bolanioz, Pediatra",
                          CupertinoIcons.check_mark_circled_solid,
                          Color(0xFF00CF8D),
                        ),
                        taskList(
                          "Turno de las 11:30",
                          "Dr. Roberto Bolanioz, Pediatra",
                          CupertinoIcons.clock_solid,
                          Color(0xFFFF9E00),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Color(0xFF30384C).withOpacity(0),
                              Color(0xFF30384C),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        backgroundColor: Color(0xFFB038F1),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
