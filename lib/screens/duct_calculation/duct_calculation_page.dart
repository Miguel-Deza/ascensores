import 'package:flutter/material.dart';
import 'package:ascensores/screens/duct_calculation/second_form.dart';
import 'package:ascensores/screens/duct_calculation/first_form.dart';

class DuctCalculationPage extends StatefulWidget {
  const DuctCalculationPage({Key? key}) : super(key: key);

  @override
  State<DuctCalculationPage> createState() => _DuctCalculationPageState();
}

class _DuctCalculationPageState extends State<DuctCalculationPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void moveNextPage() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Map<String, dynamic> data = {};

  void onDataChange(Map<String, dynamic> newData) {
    setState(() {
      data = newData;
      print("Data llamada desde el windet duct calculation");
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              FirstForm(
                onNextPagePressed: moveNextPage,
                data: data,
                onDataChange: onDataChange,
              ),
              const SecondForm(),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    2, // Número total de páginas
                    (index) => Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
