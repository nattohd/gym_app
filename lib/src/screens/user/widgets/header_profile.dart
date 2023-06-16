import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.width * 1.85,
            width: double.infinity,
            color: colors.primary,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.width * 1.72,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(200, 50),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: size.width * 0.33,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: size.width * 1.51,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: size.width * 0.11,
                            width: double.infinity,
                            child: Text(
                              'Nombre Apellido',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: colors.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Container(
                                  height: size.width * 0.16,
                                  width: size.width * 0.16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.user,
                                    ),
                                  ),
                                ),
                                title: const Text('nose'),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: colors.primary,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
