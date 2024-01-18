import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:water_jug_challenge/app/app_module.dart';
import 'package:water_jug_challenge/app/app_routes.dart';
import 'package:water_jug_challenge/imports.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Jug Challenge',
      useInheritedMediaQuery: true,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          child,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
          ],
          background: Container(
            color: const Color(0xFFF5F5F5),
          ),
        );
      },
      initialRoute: AppRoutes.home,
      initialBinding: AppModule(),
      getPages: AppRoutes.screens,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        scaffoldBackgroundColor: const Color(0xFFE7E0EE),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.lilitaOne(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
          ),
          bodyMedium: GoogleFonts.lilitaOne(
            color: const Color.fromARGB(255, 63, 62, 62),
            fontSize: 18,
          ),
        ),
        dividerColor: const Color(0xFFDBC1E4),
      ),
    );
  }
}
