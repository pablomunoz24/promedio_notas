import 'package:flutter/material.dart';
class Promedio extends StatefulWidget {
  const Promedio({super.key});

  @override
  State<Promedio> createState() => _PromedioState();
}

class _PromedioState extends State<Promedio> {
  // Función para convertir y limitar los valores
  double parseAndLimit(String input) {
    double value = double.tryParse(input) ?? 0.0;
    return value.clamp(0.0, 5.0);
  }

  double _promedioFinal = 0.0;
  final _nota60 = TextEditingController();
  final _nota10 = TextEditingController();
  final _nota102 = TextEditingController();
  final _nota20 = TextEditingController();

  void _calcularPromedio() {
    // Convertir y limitar las notas ingresadas
    double notaLab = parseAndLimit(_nota60.text);
    double notaAvance1 = parseAndLimit(_nota10.text);
    double notaAvance2 = parseAndLimit(_nota102.text);
    double notaFinal = parseAndLimit(_nota20.text);

    // Calcular el promedio
    setState(() {
      _promedioFinal = (notaLab * 0.6) + (notaAvance1 * 0.1) + (notaAvance2 * 0.1) + (notaFinal * 0.2);
      _promedioFinal = double.parse(_promedioFinal.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo de Notas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _nota60,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Ingrese la nota de laboratorio",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nota10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Ingrese la nota del primer avance",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nota102,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Ingrese la nota del segundo avance",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nota20,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: "Ingrese la nota final",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calcularPromedio,
                child: const Text("Calcular Promedio"),
              ),
              const SizedBox(height: 16.0),
              Text("Promedio Final: $_promedioFinal"),
            ],
          ),
        ),
      ),
    );
  }
}

