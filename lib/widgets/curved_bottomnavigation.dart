import 'package:flutter/material.dart';

class Bottom_curved extends StatelessWidget {
  const Bottom_curved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Nav Bar'),
      ),
      body: Stack(
        children: [
          _bottomNavigationBar(),
        ],
      ),
    );
  }
}

Widget _bottomNavigationBar() {
  return Positioned(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: _navigationBar(),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.greenAccent,
                Colors.purpleAccent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp,
            ),
          ),
          child: FloatingActionButton(
            elevation: .0,
            highlightElevation: .0,
            foregroundColor: Colors.white,
            splashColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.accessibility,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
  );
}

Widget _navigationBar() {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 800),
    curve: Curves.fastOutSlowIn,
    height: 80.0,
    color: Colors.transparent,
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      child: BottomAppBar(
        elevation: .0,
        notchMargin: 10.0,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              _iconsNavigationBar(),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _iconsNavigationBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.home,color: Colors.red,),
        onPressed: () {},
      ),
      Padding(
        padding: const EdgeInsets.only(right: 40),
        child: IconButton(
          icon: const Icon(Icons.chair,color: Colors.red,),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 40),
        child: IconButton(
          icon: const Icon(Icons.chat,color: Colors.red,),
          onPressed: () {},
        ),
      ),
      IconButton(
        icon: const Icon(Icons.person,color: Colors.red,),
        onPressed: () {},
      ),
    ],
  );
}