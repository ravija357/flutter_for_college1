import 'package:flutter/material.dart';

class StackLayoutScreen extends StatelessWidget {
  const StackLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Stack Layout'),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.amber,
              child: const Text('I am First container'),
            ),
            Positioned(
              top: 1,
              right: 1,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: const Text('I am Second container'),
              ),
            ),

            Positioned(
              top: 1,
              right: 1,
              child: ElevatedButton(onPressed: (){}, child: Text("Button")),),
            Positioned(child: Container(
              height: 100,
              width: 100,
              color: Colors.white,
              child: Text("I am white container"),
            ))
          ],
        ),
      ),
    );
  }
}
