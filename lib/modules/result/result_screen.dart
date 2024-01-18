import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/result_model.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/result_bloc.dart';
import 'package:water_jug_challenge/widgets/step/step_widget.dart';
import 'package:water_jug_challenge/widgets/step/step_widget_model.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final controller = PageController(viewportFraction: 1, keepPage: false);

  @override
  Widget build(BuildContext context) {
    List<StepModel> bestSolution = ResultModel.getBestSolution();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: const <Widget>[
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: ResultModel.goBackToHome,
            iconSize: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          SizedBox(
            height: 30,
            child: Text(
              "X capacity: ${resultBloc.jugX.value} | Y capacity: ${resultBloc.jugY.value} | Objective: ${resultBloc.jugZ.value}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 503,
            child: PageView.builder(
              controller: controller,
              itemCount: bestSolution.length,
              onPageChanged: (value) {
                StepWidgetModel.initStep(bestSolution[value]);
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return StepWidget(step: bestSolution[index], index: index);
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text(''),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
