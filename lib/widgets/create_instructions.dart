import 'package:flutter/material.dart';
import 'package:monumental/utils/colors.dart';

class CreateInstructions extends StatelessWidget {
  final bool hasTitle;
  final bool hasReminders;
  final bool hasFrecuency;
  final bool hasNotifications;
  const CreateInstructions({
    Key? key,
    required this.hasTitle,
    required this.hasReminders,
    required this.hasFrecuency,
    required this.hasNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 190.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  !hasTitle
                      ? 'Un nombre para tu habito'
                      : !hasFrecuency
                          ? 'Que tal una frecuencia?'
                          : !hasReminders
                              ? 'No te olvides de recordar'
                              : 'Comienza con este habito',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Klasik', fontSize: 20.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  !hasTitle
                      ? 'Un buen nombre puede ayudarte a recordar\n por qué es importante para ti.'
                      : !hasFrecuency
                          ? 'La frecuencia es importante para establecer\n un hábito sólido.'
                          : !hasReminders
                              ? 'Los recordatorios son una herramienta poderosa,\n que tal si añades algunos?'
                              : hasNotifications
                                  ? 'Recuerda que la práctica constante es la clave\n para establecer un hábito duradero.'
                                  : 'Todas las notificaciones han sido desactivadas. Puedes reactivarlas cuando quieras',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kFontColor.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -40.0,
            child: Image.asset(
              'images/profile.png',
              width: 75.0,
            ),
          ),
          Positioned(
            bottom: 15.0,
            width: 25.0,
            child: Image.asset(
              'images/draw_arrow.png',
              width: 65.0,
            ),
          ),
        ],
      ),
    );
  }
}
