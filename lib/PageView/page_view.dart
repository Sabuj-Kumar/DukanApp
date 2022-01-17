import 'package:dokan/Views/home_page.dart';
import 'package:dokan/Views/menu_page.dart';
import 'package:dokan/Views/person_page.dart';
import 'package:dokan/Views/shopping_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VIewPage extends StatefulWidget {
  const VIewPage({Key? key, required this.image, required this.email})
      : super(key: key);
  final XFile? image;
  final String? email;
  @override
  State<VIewPage> createState() => _VIewPageState();
}

class _VIewPageState extends State<VIewPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          const HomePage(),
          const MenuPage(),
          const ShoppingPage(),
          PersonAccount(
            image: widget.image,
            email: widget.email,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffF75F55),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0),
          child: Icon(
            Icons.search,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: BottomAppBarData(
          chieldren: [
            BottomItem(
              iconData: Icons.home_rounded,
            ),
            BottomItem(
              iconData: Icons.apps_sharp,
              padding: const EdgeInsets.only(right: 30.0),
            ),
            BottomItem(
              iconData: Icons.local_grocery_store_outlined,
              padding: const EdgeInsets.only(left: 30.0),
            ),
            BottomItem(
              iconData: Icons.person_outline_sharp,
            )
          ],
          onTap: (index) {
            setState(() {
              currentPage = index;
              _controller.animateToPage(currentPage,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            });
          },
          currentIndex: currentPage,
        ),
      ),
    );
  }
}

class BottomAppBarData extends StatelessWidget {
  const BottomAppBarData(
      {Key? key,
      required this.chieldren,
      required this.currentIndex,
      required this.onTap})
      : super(key: key);

  final List<BottomItem> chieldren;
  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            chieldren.length,
            (index) => InkWell(
                  onTap: () {
                    onTap(index);
                  },
                  child: Padding(
                    padding: chieldren[index].padding,
                    child: Icon(
                      chieldren[index].iconData,
                      color: index == currentIndex
                          ? Colors.orange
                          : Colors.black54,
                      size: 35,
                    ),
                  ),
                )),
      ),
    );
  }
}

class BottomItem {
  final IconData iconData;
  final EdgeInsets padding;

  BottomItem(
      {Key? key, required this.iconData, this.padding = EdgeInsets.zero});
}
