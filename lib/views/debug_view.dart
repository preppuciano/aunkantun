// import 'dart:convert';
// import 'package:aukantun/models/card_model.dart';
// import 'package:aukantun/models/deck_model/deck_model.dart';
// import 'package:aukantun/repository/firestore_repository.dart';
// import 'package:aukantun/services/database_service.dart';
// import 'package:aukantun/widgets/core/core_button.dart';
// import 'package:aukantun/widgets/core/core_padding.dart';
// import 'package:aukantun/widgets/core_background.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DebugView extends StatelessWidget {
//   const DebugView({super.key});

//   Future<void> handle() async {
//     // String jsonString =
//     //     await rootBundle.loadString('assets/sounds/family_2.json');
//     // final jsonResponse = json.decode(jsonString);
//     // const gameId = 'OBFQvm1Qk1aqMYp6xgGA';
//     // const deckBaseId = 'Fphe6StyUS1qzH0kwS4R';
//     // const deckId = 'DY40NnmtEsRgM5mfUOsA';
//     // for (var e in jsonResponse) {
//     //   final ref = FirestoreRepository()
//     //       .db
//     //       .collection('games')
//     //       .doc(gameId)
//     //       .collection('base')
//     //       .doc(deckBaseId)
//     //       .collection('decks')
//     //       .doc(deckId)
//     //       .collection('cards')
//     //       .doc();
//     //   CardModel card = CardModel.fromMap({
//     //     ...e,
//     //     'gameId': gameId,
//     //     'deckId': deckBaseId,
//     //     'deckBaseId': deckId,
//     //     'id': ref.id,
//     //   });
//     //   await ref.set(card.toMap());
//     // }
//     // print(jsonResponse); // Aquí puedes manejar el JSON según lo que necesites
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CoreBackground(
//         child: CorePadding(
//           child: Column(
//             children: [
//               CoreButton(
//                 text: 'Custom Seed',
//                 onPressed: () async {
//                   print('📃 start custom');
//                   handle();
//                   return;
//                   // final docRef = FirestoreRepository()
//                   //     .db
//                   //     .collection('games')
//                   //     .doc('OBFQvm1Qk1aqMYp6xgGA')
//                   //     .collection('base');
//                   // final data = await docRef.doc('3opvvImQF7A5k4IcHIFS').get();
//                   // final newRef = docRef.doc();
//                   // newRef.set({...data.data()!, 'id': newRef.id});

//                   final docRef = FirestoreRepository()
//                       .db
//                       .collection('games')
//                       .doc('OBFQvm1Qk1aqMYp6xgGA')
//                       .collection('base');
//                   final data = await docRef.doc('Fphe6StyUS1qzH0kwS4R').get();
//                   final newRef =
//                       docRef.doc('Fphe6StyUS1qzH0kwS4R').collection('decks');
//                   newRef.add(data.data()!);
//                   print('📃 end custom');
//                 },
//               ),
//               CoreButton(
//                 text: 'Cards Seed',
//                 onPressed: () async {
//                   print('📃 start seed cards');
//                   // await seedCards();
//                   print('📃 end seed cards');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
