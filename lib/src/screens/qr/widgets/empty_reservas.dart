import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyReservas extends StatelessWidget {
  const EmptyReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset(
          'assets/images/nothing.png',
          fit: BoxFit.cover,
        )),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),
                ),
              ),
              elevation: MaterialStateProperty.all(10), //this adds shadow
              overlayColor: MaterialStateProperty.all(
                  Colors.grey[200]), //this adds highlight
            ),
            onPressed: () {
              context.push('/reserve');
            },
            child: Text(
              'Reserva tu hora aquí !',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}
