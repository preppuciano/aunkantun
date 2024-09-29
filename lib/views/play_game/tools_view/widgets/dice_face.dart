import 'package:aukantun/config/app_color.dart';
import 'package:flutter/material.dart';

class DiceFace extends StatelessWidget {
  final int number; // El número de la cara del dado

  const DiceFace({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.appleGreen,
        gradient: AppColor.infoGradientColor,
        border: Border.all(
            color: AppColor.charcoalColor.withOpacity(0.5), width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Color de la sombra
            spreadRadius: 5, // Propiedad para expandir la sombra
            blurRadius: 7, // Desenfoque de la sombra
            offset: Offset(0, 3), // Desplazamiento de la sombra
          ),
        ],
      ),
      child: GridView.count(
        crossAxisCount: 3, // 3 columnas para simular un dado
        children: _buildDots(),
      ),
    );
  }

  List<Widget> _buildDots() {
    // Inicializar todas las posiciones en blanco (sin puntos)
    List<Widget> dots = List.generate(9, (index) => Container());

    // Determinar qué puntos mostrar según el número de la cara del dado
    switch (number) {
      case 1:
        dots[4] = _buildDot(); // Punto central
        break;
      case 2:
        dots[0] = _buildDot(); // Esquinas opuestas
        dots[8] = _buildDot();
        break;
      case 3:
        dots[0] = _buildDot(); // Esquinas opuestas + centro
        dots[4] = _buildDot();
        dots[8] = _buildDot();
        break;
      case 4:
        dots[0] = _buildDot(); // Las 4 esquinas
        dots[2] = _buildDot();
        dots[6] = _buildDot();
        dots[8] = _buildDot();
        break;
      case 5:
        dots[0] = _buildDot(); // 4 esquinas + centro
        dots[2] = _buildDot();
        dots[4] = _buildDot();
        dots[6] = _buildDot();
        dots[8] = _buildDot();
        break;
      case 6:
        dots[0] = _buildDot(); // 2 columnas llenas
        dots[2] = _buildDot();
        dots[3] = _buildDot();
        dots[5] = _buildDot();
        dots[6] = _buildDot();
        dots[8] = _buildDot();
        break;
      default:
        break;
    }

    return dots;
  }

  Widget _buildDot() {
    return Center(
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
