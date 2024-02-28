import 'package:ascensores/screens/bottom/cotizations/cabin_details_screen.dart';
import 'package:ascensores/screens/bottom/cotizations/door_details_screen.dart';
import 'package:ascensores/screens/bottom/cotizations/general_data_screen.dart';

import 'package:flutter/material.dart';


class CotizationPricesPage extends StatefulWidget {
  const CotizationPricesPage({Key? key}) : super(key: key);

  @override
  State<CotizationPricesPage> createState() => _CotizationPricesPageState();
}

class _CotizationPricesPageState extends State<CotizationPricesPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const <Widget>[
              GeneralDataScreen(),
              DoorDetailsScreen(),
              CabinDetailsScreen(),
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
                    3, // Número total de páginas
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
