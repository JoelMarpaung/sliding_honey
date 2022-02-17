import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../layout/layout.dart';
import '../../globals.dart';

class EasyLevelScreen extends StatelessWidget {
  /// {@macro puzzle_view}
  const EasyLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy'),
      ),
      drawer: drawer(context),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: const PuzzleSections(),
          ),
        );
      }),
      //body: const PuzzleBoardHoney(),
    );
  }
}

class PuzzleSections extends StatefulWidget {
  /// {@macro puzzle_sections}
  const PuzzleSections({Key? key}) : super(key: key);

  @override
  State<PuzzleSections> createState() => _PuzzleSectionsState();
}

class _PuzzleSectionsState extends State<PuzzleSections> {
  @override
  void dispose() {
    puzzleInitiated = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: [
          Container(
            color: Colors.cyan,
          ),
          const PuzzleBoardHoney(size: 350),
          Container(
            color: Colors.teal,
          ),
        ],
      ),
      medium: (context, child) => Column(
        children: [
          Container(
            color: Colors.cyan,
          ),
          const PuzzleBoardHoney(size: 550),
          Container(
            color: Colors.teal,
          ),
        ],
      ),
      large: (context, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.cyan,
            ),
          ),
          const PuzzleBoardHoney(size: 600),
          Expanded(
            child: Container(
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}

// class EasyLevelScreen extends StatefulWidget {
//   static MaterialPage page() {
//     return const MaterialPage(child: EasyLevelScreen());
//   }

//   const EasyLevelScreen({Key? key}) : super(key: key);

//   @override
//   State<EasyLevelScreen> createState() => _EasyLevelScreenState();
// }

// class _EasyLevelScreenState extends State<EasyLevelScreen> {
//   @override
//   Widget build(BuildContext context) {
//     bool isHandset = MediaQuery.of(context).size.width < 1200;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Easy'),
//       ),
//       drawer: drawer(context),
//       body: LayoutBuilder(builder: (context, constraints) {
//         return SingleChildScrollView(
//           child: Flex(
//             direction: isHandset ? Axis.vertical : Axis.horizontal,
//             children: [
//               Flexible(
//                 fit: FlexFit.loose,
//                 //flex: 1,
//                 child: Container(),
//               ),
//               const Flexible(
//                 fit: FlexFit.loose,
//                 flex: 4,
//                 child: PuzzleBoardHoney(),
//               ),
//               Flexible(
//                 fit: FlexFit.loose,
//                 //flex: 1,
//                 child: Container(),
//               ),
//             ],
//           ),
//         );
//       }),
//       //body: const PuzzleBoardHoney(),
//     );
//   }
// }
