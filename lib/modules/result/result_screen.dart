import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/result_model.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
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
          const SizedBox(height: 16),
          SizedBox(
            height: 600,
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
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: controller,
            count: bestSolution.length,
            onDotClicked: (index) => controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            effect: const SlideEffect(
              spacing: 8.0,
              radius: 4.0,
              dotWidth: 24.0,
              dotHeight: 16.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 1.5,
              dotColor: Colors.grey,
              activeDotColor: Colors.indigo,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
