import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/home/home_model.dart';
import 'package:water_jug_challenge/modules/result/result_bloc.dart';
import 'package:water_jug_challenge/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Water Jug Challenge',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'First gallon capacity (X)',
              onChanged: (value) {
                resultBloc.jugX.value = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Second gallon capacity (Y)',
              onChanged: (value) {
                resultBloc.jugY.value = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Desired amount of water (Z)',
              onChanged: (value) {
                resultBloc.jugZ.value = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 80),
            Obx(() {
              bool canClickButton = resultBloc.jugX.value > 0 &&
                  resultBloc.jugY.value > 0 &&
                  resultBloc.jugZ.value > 0;

              return ElevatedButton(
                onPressed: canClickButton ? HomeModel.onTapMeasureWater : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue.withOpacity(canClickButton ? 1 : 0.5),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
