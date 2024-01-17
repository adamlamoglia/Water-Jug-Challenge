import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/result_model.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
        children: [
          Expanded(
            child: bestSolution.isEmpty
                ? const Center(
                    child: Text(
                      'No Solution',
                    ),
                  )
                : ListView.builder(
                    itemCount: bestSolution.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          bestSolution[index].action.toString(),
                        ),
                        subtitle: Text(
                          'Actual X: ${bestSolution[index].actualX} - Actual Y: ${bestSolution[index].actualY} - Action: ${bestSolution[index].action}',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
