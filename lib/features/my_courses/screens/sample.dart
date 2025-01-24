import 'package:flutter/material.dart';

class AnimatedTabBarScreen extends StatefulWidget {
  @override
  _AnimatedTabBarScreenState createState() => _AnimatedTabBarScreenState();
}

class _AnimatedTabBarScreenState extends State<AnimatedTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated TabBar"),
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Rounded indicator
            color: Colors.blueAccent,
          ),
          unselectedLabelColor: Colors.white60,
          labelColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.favorite), text: "Favorites"),
            Tab(icon: Icon(Icons.settings), text: "Settings"),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AnimatedTabContent(
            color: Colors.blue.shade100,
            text: "Home Tab",
          ),
          AnimatedTabContent(
            color: Colors.red.shade100,
            text: "Favorites Tab",
          ),
          AnimatedTabContent(
            color: Colors.green.shade100,
            text: "Settings Tab",
          ),
        ],
      ),
    );
  }
}

class AnimatedTabContent extends StatefulWidget {
  final Color color;
  final String text;

  const AnimatedTabContent({
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedTabContentState createState() => _AnimatedTabContentState();
}

class _AnimatedTabContentState extends State<AnimatedTabContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        color: widget.color,
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}