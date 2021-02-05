import 'package:farm_expenses/layout/layout_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarLayout extends StatelessWidget {
  final LayoutController controller = LayoutController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingBtn(),
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: GetBuilder(
          init: controller,
          builder: (_) => controller.tabs[controller.currentIndex]),
    );
  }

  Widget _floatingBtn() {
    return SizedBox(
      height: 40,
      child: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Text("\u20b9", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  // Widget _bottomNavBar() {
  //   return GetBuilder(
  //     init: controller,
  //     builder: (_) => BottomNavigationBar(
  //       selectedItemColor: Colors.white,
  //       unselectedItemColor: Colors.white,
  //       // backgroundColor: Colors.teal,
  //       type: BottomNavigationBarType.shifting,
  //       showUnselectedLabels: true,
  //       currentIndex: controller.currentIndex,
  //       onTap: (index) {
  //         controller.onTap(index);
  //       },
  //       items: [
  //         _navBarItem(icon: Icon(Icons.home), label: "Home",index: 0),
  //         _navBarItem(icon: Icon(Icons.description), label: "Reports",index:1),
  //         _navBarItem(icon: Icon(Icons.agriculture), label: "Farms",index:2),
  //         _navBarItem(icon: Icon(Icons.more_vert), label: "More",index:3)
  //       ],
  //     ),
  //   );
  // }
  Widget _bottomNavBar() {
    return  Row(children: [
        _navBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "Home",
            index: 0),
        _navBarItem(
            icon: Icon(Icons.description, color: Colors.white),
            label: "Reports",
            index: 1),
        _navBarItem(
            icon: Icon(Icons.agriculture, color: Colors.white),
            label: "Farms",
            index: 2),
        _navBarItem(
            icon: Icon(Icons.more_vert, color: Colors.white),
            label: "More",
            index: 3)
      ]
    );
  }

  Widget _navBarItem(
      {@required Widget icon, @required String label, @required int index}) {
    return GestureDetector(
      onTap: () {
        controller.onTap(index);
      },
      child: GetBuilder(
        init: controller,
        builder: (_) => _customBottomNavigationBarItem(
            icon: icon,
            label: label,
            backgroundColor: controller.currentIndex == index
                ? Colors.teal.shade700
                : Colors.teal),
      ),
    );
  }

  Widget _customBottomNavigationBarItem(
      {@required Widget icon,
      @required String label,
      @required Color backgroundColor}) {
    return Container(
      height: Get.height * .06,
      alignment: Alignment.center,
      width: Get.width / 4,
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            height: 1,
          ),
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text("Farm Expenses"),
      backgroundColor: Colors.green,
      actions: [_notificationBtn()],
    );
  }

  Widget _notificationBtn() {
    final double size = Get.width * .07;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(children: [
            ImageIcon(AssetImage("assets/icons/bell.png"), size: 20),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent.shade400)),
            )
          ]),
        ),
      ),
    );
  }
}
