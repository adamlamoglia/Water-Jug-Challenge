import 'package:water_jug_challenge/imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  final String labelText;
  final Function(String) onChanged;

  @override
  Widget build(Object context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: labelText),
      onChanged: onChanged,
    );
  }
}
