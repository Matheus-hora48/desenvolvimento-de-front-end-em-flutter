import 'package:flutter/material.dart';

class TabBarName extends StatefulWidget {
  final PageController pageController;

  const TabBarName({
    super.key,
    required this.pageController,
  });

  @override
  TabBarNameState createState() => TabBarNameState();
}

class TabBarNameState extends State<TabBarName> {
  int _nameSelectedIndex = 0;

  void selectName(int index) {
    setState(() {
      _nameSelectedIndex = index;
    });
    widget.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  selectName(0);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Atividade',
                    style: TextStyle(
                      color: _nameSelectedIndex == 0
                          ? const Color(0xFF4E97FE)
                          : const Color(0xFFC7C6CA),
                      fontSize: 15.59,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectName(1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Sobre',
                    style: TextStyle(
                      color: _nameSelectedIndex == 1
                          ? const Color(0xFF4E97FE)
                          : const Color(0xFFC7C6CA),
                      fontSize: 15.59,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectName(2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Avisos e Comunicados',
                    style: TextStyle(
                      color: _nameSelectedIndex == 2
                          ? const Color(0xFF4E97FE)
                          : const Color(0xFFC7C6CA),
                      fontSize: 15.59,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
