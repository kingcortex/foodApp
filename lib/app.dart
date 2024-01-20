import 'package:app_cooking/screens/home_page.dart';
import 'package:app_cooking/widget/custom_floting_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/botom_navigation_provider.dart';
import 'bottom_navigation/custom_buttom_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNAvigationState>(
      builder: (BuildContext context, BottomNAvigationState bottomNAvigationState, Widget? child) { 
        return Scaffold(
          extendBody: true,
          body: PageView(
            controller: controller,
            children: [
              const HomePage(),
              Container(height: double.infinity, width: double.infinity,color: Colors.yellow,),
              Container(height: double.infinity, width: double.infinity,color: Colors.purpleAccent,),
              Container(height: double.infinity, width: double.infinity,color: Colors.red.shade300,),
            ],
            onPageChanged: (value) => bottomNAvigationState.changePage(value, controller),
          ),
          // [bottomNAvigationState.currentIndex],
      
          bottomNavigationBar: CustomBottomBar(
            pageController: controller,
            onTap: bottomNAvigationState.changePage,
          ),
          floatingActionButton: const CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },

    );
  }
}