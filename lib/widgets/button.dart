import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: ElevatedButton(
//         onPressed: () {},
//         child: Text('Elevated Button'),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Buttons'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                onPressed: () {
                  print('Elevated Button tapped');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 196, 171, 199)),
                child: const Text('Elevated Button'),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FilledButton(
                onPressed: () {
                  print('I am filled');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Filled'),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  // width: MediaQuery.sizeOf(context).width,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    child: const Text('Filled Tonal'),
                  ),
                ),
                const SizedBox(width: 110),
                SizedBox(
                  // width: MediaQuery.sizeOf(context).width,
                  child: FilledButton.tonal(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 87, 167, 118)),
                    onPressed: () {},
                    // child: const Text('Filled Icon'),
                    // ignore: prefer_const_constructors
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        const Text('Filled Icon'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('text button pressed');
                },
                // child: const Text('Text button'),
                child: GestureDetector(
                  onTap: () {
                    print('Text button pressed');
                  },
                  child: const Text('Text button'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
