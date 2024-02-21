
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedMenuOpt=0;

  final PageController _pageController = PageController();

  int get selectedMenuOpt{
    return _selectedMenuOpt;
  }

  PageController get pageController => _pageController;

  set selectedMenuOpt(int index){
    _selectedMenuOpt = index;
    _pageController.animateToPage(index,duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }


}