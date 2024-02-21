import 'package:flutter/material.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/screens/screens.dart';
import 'package:provider/provider.dart';


class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screens(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final uiPorvider = Provider.of<UiProvider>(context);
    final currentIndex = uiPorvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiPorvider.selectedMenuOpt= i,
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon:  Icon(Icons.person_outline),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon:  Icon(Icons.public),
          label: 'Encabezado',
        ),
      ]
      );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final uiPorvider = Provider.of<UiProvider>(context);
    final pageController = uiPorvider.pageController;

    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: const [
    
        Tab1Screen(),
    
        Tab2Screen(),
      ],
    );
  }
}