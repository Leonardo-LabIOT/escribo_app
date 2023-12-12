import 'package:flutter/material.dart';
import 'package:escribo_app/Views/favorite_view.dart';
import 'package:escribo_app/Views/library_view.dart';

import 'package:flutter/material.dart';
import 'package:escribo_app/Views/favorite_view.dart';
import 'package:escribo_app/Views/library_view.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a GlobalKey to force a rebuild when the title changes
  final GlobalKey<_HomePageState> _key = GlobalKey<_HomePageState>();

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    // Check if the title has changed, and force a rebuild if it has.
    if (widget.title != oldWidget.title) {
      _key.currentState?.forceRebuild();
    }
    super.didUpdateWidget(oldWidget);
  }

  void forceRebuild() {
    setState(() {
      // You can perform additional actions here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: widget.title == "Library" ? LibraryScreen() : FavoriteScreen(),
      ),
    );
  }
}




// class HomePage extends StatefulWidget {
//   final String title;
//   const HomePage({super.key, required this.title});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _view = 0;

//   void _incrementCounter() {
//     setState(() {
//       _view++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the HomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '$_view',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             Library_Screen(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
