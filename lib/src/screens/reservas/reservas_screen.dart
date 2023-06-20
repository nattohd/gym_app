import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/src/screens/reservas/widgets/body_calendar.dart';
import 'package:gym_app/src/screens/reservas/widgets/header_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservasScreen extends StatefulWidget {
  const ReservasScreen({super.key});

  @override
  State<ReservasScreen> createState() => _ReservasScreenState();
}

class _ReservasScreenState extends State<ReservasScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    PageController pageController = PageController(initialPage: 0);
    Size size = MediaQuery.of(context).size;
    // Color(0xff0060a8)
    bool _isExpanded = false;

    void _toggleExpansion() {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }

    void scrollToPage(int pageNumber) {
      pageController.animateToPage(
        pageNumber,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu Hora'),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          //inicio pagina 1
          Column(
            children: [
              SizedBox(
                height: size.width * 0.8,
                width: size.width * 0.8,
                child: SvgPicture.asset(
                  'assets/images/select.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 35),
                child: Text(
                  'Ingrese su proposito',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
              ),

              //parte dropdown
              Container(
                // height: size.width * 0.15,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: const Offset(1, 1),
                      blurRadius: 8,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: ClipRect(
                  child: ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: FaIcon(
                        FontAwesomeIcons.arrowRightFromBracket,
                        color: colors.primary,
                      ),
                    ),
                    title: Text(
                      'Proposito',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: colors.primary,
                      ),
                    ),
                    children: [
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 10),
                          child: FaIcon(
                            FontAwesomeIcons.arrowRotateLeft,
                            color: colors.primary,
                          ),
                        ),
                        title: Text(
                          'Clase Recuperativa',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: colors.primary,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 10),
                          child: FaIcon(
                            FontAwesomeIcons.dumbbell,
                            color: colors.primary,
                          ),
                        ),
                        title: Text(
                          'Entrenamiento',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: colors.primary,
                          ),
                        ),
                        // onTap: () => {},
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 10),
                          child: FaIcon(
                            FontAwesomeIcons.personChalkboard,
                            color: colors.primary,
                          ),
                        ),
                        title: Text(
                          'Clases',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: colors.primary,
                          ),
                        ),
                        // onTap: () => {},
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 5,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton(
                    onPressed: () {
                      scrollToPage(1);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tooltip: 'Continuar con el proceso de agregar cuenta',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(),
                        const Text(
                          'Continuar',
                          style: TextStyle(
                            // color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.angleRight,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //inicio pagina 1

          //inicio pagina 2
          const Column(
            children: [
              HeaderCalendar(),
              Expanded(
                child: BodyCalendar(),
              )
            ],
          ),
          //fin pagina 2

          //inicio pagina 3

          //fin pagina 3
        ],
      ),
    );
  }
}
