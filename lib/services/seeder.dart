// import 'package:aukantun/models/deck_model/deck_model.dart';
// import 'package:aukantun/models/deck_model/options_deck_map.dart';
// import 'package:aukantun/models/enums/deck_type_enum.dart';
// import 'package:aukantun/models/enums/turn_mode_enum.dart';
// import 'package:aukantun/models/file_model.dart';
// import 'package:aukantun/models/game_model/game_model.dart';
// import 'package:aukantun/models/game_model/info_game_map.dart';
// import 'package:aukantun/models/game_model/options_game_map.dart';
// import 'package:aukantun/services/database_service.dart';

// final games = [
//   GameModel(
//     id: "8Pu1afiS9Ue39mx9veQ5",
//     title: "Amigos de Mierda",
//     author: "Aukantun",
//     info: InfoGameMap(
//         description:
//             "Amigos de Mierda es un juego de mesa ideal para romper amistades. Es un juego de cartas donde vienen preguntas altas en humor negro, y tendrán que elegir a ese amigo que calce mejor con la pregunta que se está haciendo. ¿Quién de nosotros pide plata prestada sabiendo que nunca la va a devolver? o Llegó el Apocalipsis Zombie, ¿quién muere primero? Elijan a la primera persona que se les venga a la cabeza. Quien junte 5, se corona como el Amigo de Mierda!",
//         instructions:
//             "En el juego Amigos de Mierda, una vez por turno, un jugador tendrá que sacar una carta que vendrá con una pregunta alta en humor negro. Ese jugador tendrá que leerla en voz alta y todos los jugadores tendrán que pensar en la primera persona que se les venga a la cabeza. Cuentan hasta tres, y todo el grupo apunta a esa o esas personas. La más votada se lleva la carta. Y quien junte 5 se corona como el «AMIGO DE MIERDA». Simple, sencillo y muy rompeamistades.",
//         duration: 40,
//         minimumAge: 18,
//         name: "Amigos de Mierda",
//         numberPlayers: 4,
//         bodyHTML:
//             "<p>Amigos de Mierda es un juego de mesa ideal para romper amistades. Es un juego de cartas donde vienen preguntas altas en humor negro, y tendrán que elegir a ese amigo que calce mejor con la pregunta que se está haciendo. ¿Quién de nosotros pide plata prestada sabiendo que nunca la va a devolver? o Llegó el Apocalipsis Zombie, ¿quién muere primero? Elijan a la primera persona que se les venga a la cabeza. Quien junte 5, se corona como el Amigo de Mierda!</p>",
//         poster: FileModel(
//             url:
//                 "https://www.ouroborostore.cl/wp-content/uploads/2024/01/JDM4204-Amigos-de-Mierda-Juego-de-Mesa-1-510x510.jpg")),
//     icon: FileModel(
//         url:
//             "https://www.ouroborostore.cl/wp-content/uploads/2024/01/JDM4204-Amigos-de-Mierda-Juego-de-Mesa-510x510.jpg"),
//     isEnabled: true,
//     isVisble: true,
//     index: 0,
//     options: OptionsGameMap(
//       countDown: false,
//       dice: false,
//       randomNumbers: false,
//       scoreBoard: false,
//       turnMode: TurnMode.normal,
//     ),
//   ),
// ];

// final decks = [
//   DeckModel(
//     cardCount: 10,
//     id: "hQJbciVCGdQ766vWGKc9",
//     description: "Este es el mazo principal donde sacaran cartas",
//     name: "Mazo principal",
//     index: 0,
//     isRequired: true,
//     deckType: DeckType.base,
//     options: OptionsDeckMap(
//       infiniteCards: false,
//     ),
//   ),
//   DeckModel(
//     cardCount: 10,
//     id: "acW124VCGdQ766vWGKc9",
//     description: "Este es el mazo secundarios donde sacaran cartas",
//     name: "Mazo Secundario",
//     index: 1,
//     isRequired: false,
//     deckType: DeckType.base,
//     options: OptionsDeckMap(
//       infiniteCards: false,
//     ),
//   )
// ];
// final List<Map<String, dynamic>> cards = [
//   {
//     "id": "IgG1RDmLYi6Hwi6nntLr",
//     "content":
//         "¿Quién se pide lo más caro de la carta y se hace el boludo para dividir la cuenta entre todos?",
//     "index": 1
//   },
//   {
//     "id": "QmruXvxsqvqFeHGAqOWc",
//     "content": "¿Quién de nosotros es secretamente un supervillano?",
//     "index": 2
//   },
//   {
//     "id": "jy1BAP21iXZVTgURIaH6",
//     "content":
//         "Nos eligen senadores a todos. ¿Quién se va a casar con alguien que todavía no nació?",
//     "index": 3
//   },
//   {
//     "id": "CwNv5DYdHsxPwlswQUMt",
//     "content": "¿Quién mea en la pileta?",
//     "index": 4
//   },
//   {
//     "id": "1aMD4z5GVLfbUG1WwMkp",
//     "content":
//         "¿Quién tiene más chances de ir a la cárcel por un crimen que no cometió?",
//     "index": 5
//   },
//   {
//     "id": "WHGTFwHV65nwkQ73tprB",
//     "content": "¿Quién hace más guita cobrando coimas?",
//     "index": 6
//   },
//   {
//     "id": "ZHqn5RzfRJzRsIMdaMdG",
//     "content":
//         "Ganamos la lotería y dividimos el premio entre todos. ¿Quién es el primero en perder todo lo que ganó?",
//     "index": 7
//   },
//   {
//     "id": "Y4ElcBV7NgNODMHSzzeJ",
//     "content":
//         "A partir de este año van a entregar un Nobel a la falta de aseo personal. ¿Quién de nosotros va a ser nominado seguro?",
//     "index": 8
//   },
//   {
//     "id": "t0Ywxviz9zTveNuxvOWu",
//     "content":
//         "Uno de nosotros se hace el boludo, pero está secretamente resentido por el resultado de otra tarjeta. ¿Quién?",
//     "index": 9
//   },
//   {
//     "id": "kBTu1lb56d4EWqcUDPgs",
//     "content": "¿Quién de nosotros es en realidad un robot?",
//     "index": 10
//   },
//   {
//     "id": "ihNz1Kk2ByqNOzmRK10H",
//     "content":
//         "¿Quién se pide plata prestada sabiendo que nunca la va a devolver?",
//     "index": 11
//   },
//   {
//     "id": "Ir44I0zWSBDZd4tOFCae",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 12
//   },
//   {
//     "id": "RcFMQwUoOmPpA191R7iR",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 13
//   },
//   {
//     "id": "NAELXqyOaMJfazhh7Bjq",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 14
//   },
//   {
//     "id": "RKho3xedjijrk0wFgMvZ",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 15
//   },
//   {
//     "id": "DoZh9BMeOlVUnFYwStED",
//     "content": "¿A quién de nosotros no te animarías a hacer enojar?",
//     "index": 16
//   },
//   {
//     "id": "l2WcpoNQCwJ43OfYe696",
//     "content": "¿Quién quisieras que nunca adopte un hijo tuyo?",
//     "index": 17
//   },
//   {
//     "id": "I3NHHoVUyia2rhCRn8WL",
//     "content":
//         "Todos tenemos nuestras cosas, pero uno de nosotros es realmente inmaduro para su edad. ¿Quién?",
//     "index": 18
//   },
//   {
//     "id": "PP8CjrQz5QGeRgAteNJk",
//     "content":
//         "Vuelve la colimba. ¿Quién se pega un tiro en el pie para no hacerla?",
//     "index": 19
//   },
//   {
//     "id": "dXgMsamm4AJx0o7C77oH",
//     "content":
//         "Tenés que pegarle una trompada en la cara a uno de nosotros. ¿A quién?",
//     "index": 20
//   },
//   {
//     "id": "LnVwYN5p6BczZfhet2zS",
//     "content": "¿Quién de nosotros se cree mejor que todos los demás?",
//     "index": 21
//   },
//   {
//     "id": "eJkfhIsmDfTTtY91x6By",
//     "content":
//         "De un día para el otro, el mundo se queda sin Internet. ¿Quién se mata primero?",
//     "index": 22
//   },
//   {
//     "id": "7Ktp7of0GrqwvOZkMYI8",
//     "content":
//         "Somos los biólogos más capaces del planeta. ¿Quién inventa un virus para después vender la cura?",
//     "index": 23
//   },
//   {
//     "id": "9DlfuoEjHJaFTe2lsm9w",
//     "content": "¿A quién de nosotros no te animarías a hacer enojar?",
//     "index": 24
//   },
//   {
//     "id": "ygsbxZ2VvMvla6QMDeV0",
//     "content": "¿Quién lee la Biblia?",
//     "index": 25
//   },
//   {
//     "id": "APfc7FiLVSMAQqJOvM8T",
//     "content":
//         "Vamos a jugar a un juego nuevo. ¿Quién tarda más en entender las reglas?",
//     "index": 26
//   },
//   {
//     "id": "dIMlGNBbaYuMC1kEawEv",
//     "content":
//         "Alquilamos una casa en la costa y está todo listo. ¿Quién se baja a último momento?",
//     "index": 27
//   },
//   {
//     "id": "q1sTyTIXr540nmtAcwz3",
//     "content":
//         "Somos todos cómplices de un crimen y nos están interrogando. ¿Quién es el primero en quebrar y confesar?",
//     "index": 28
//   },
//   {
//     "id": "mHOMPNRXZryqfPNFAO1P",
//     "content":
//         "Somos los protagonistas de un thriller de suspenso. Al final, ¿quién es el asesino?",
//     "index": 29
//   },
//   {
//     "id": "wLD1kkBaLwkOXwy9vcRy",
//     "content":
//         "Un amigo en común necesita con urgencia dadores de sangre. ¿Quién dice que fue y no fue?",
//     "index": 30
//   },
//   {
//     "id": "9Nsk9LIjS7a0vuEikGgC",
//     "content":
//         "¡Escándalo! Reveladoras fotos de una orgía de octogenarios. ¿A quién no querrías jamás como jefe?",
//     "index": 31
//   },
//   {
//     "id": "eicjHmooKQf7WnK4rM71",
//     "content": "Uno de nosotros está envejeciendo peor que los demás. ¿Quién?",
//     "index": 32
//   },
//   {
//     "id": "LGXtDX17FgykLPZZGoC7",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 33
//   },
//   {
//     "id": "Seqk95U2hNgH90lYyjbw",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 34
//   },
//   {
//     "id": "VAzsE2loda4nWUt87VTw",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 35
//   },
//   {
//     "id": "7hhSd7mPMQaz4tknC3il",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 36
//   },
//   {
//     "id": "w1ATHvhf8k1YtGww3c81",
//     "content":
//         "¿Quién de nosotros no entiende la gracia de este juego, pero se ríe de compromiso para no quedar como el ojete? ¿Quién?",
//     "index": 37
//   },
//   {
//     "id": "PhsmHFhZe8QdG2xPXUgi",
//     "content":
//         "Necesitamos a alguien para comandar a nuestras tropas. Por favor, que no sea... ¿Quién?",
//     "index": 38
//   },
//   {
//     "id": "ZwdfGO6jtpKt9CvNrCOZ",
//     "content":
//         "Uno de nosotros se hace el boludo, pero está secretamente resentido por el resultado de otra tarjeta. ¿Quién?",
//     "index": 39
//   },
//   {
//     "id": "byV172uTfpXkLiCwT0kd",
//     "content": "¿Quién de nosotros es en realidad un robot?",
//     "index": 40
//   },
//   {
//     "id": "ekStE0CJA3Oa7lDOz2KH",
//     "content":
//         "¿Quién se pide plata prestada sabiendo que nunca la va a devolver?",
//     "index": 41
//   },
//   {
//     "id": "LmiprBa5m31W2AtCdOyF",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 42
//   },
//   {
//     "id": "AvFKssTx7dag2W6mpdJ6",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 43
//   },
//   {
//     "id": "vui4IEgxf9dHwyyfntVJ",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 44
//   },
//   {
//     "id": "C2HnQ0uxdghsthoayuYn",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 45
//   },
//   {
//     "id": "g8sHLfA9mlEm2KChlunR",
//     "content": "¿A quién de nosotros no te animarías a hacer enojar?",
//     "index": 46
//   },
//   {
//     "id": "PYIi8Vrh44AiIrTbnuih",
//     "content": "¿Quién lee la Biblia?",
//     "index": 47
//   },
//   {
//     "id": "USscdlvTtvSennmWk5yw",
//     "content":
//         "Vamos a jugar a un juego nuevo. ¿Quién tarda más en entender las reglas?",
//     "index": 48
//   },
//   {
//     "id": "cjP7FHqUKEmvLi9dcNFd",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 49
//   },
//   {
//     "id": "8tCnPHYfDsaRElpDPBk2",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 50
//   },
//   {
//     "id": "Da0LDi13h2vAOVe1oPcP",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 51
//   },
//   {
//     "id": "XPwJbRN2aFUSfH427EZN",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 52
//   },
//   {
//     "id": "EzWODp3sShARSyrJkziw",
//     "content":
//         "¿Quién de nosotros no entiende la gracia de este juego, pero se ríe de compromiso para no quedar como el ojete? ¿Quién?",
//     "index": 53
//   },
//   {
//     "id": "Sk31JJUZU2MxVX06ufBf",
//     "content":
//         "Necesitamos a alguien para comandar a nuestras tropas. Por favor, que no sea... ¿Quién?",
//     "index": 54
//   },
//   {
//     "id": "NTVw2QUeWegIH25pAUon",
//     "content":
//         "Uno de nosotros se hace el boludo, pero está secretamente resentido por el resultado de otra tarjeta. ¿Quién?",
//     "index": 55
//   },
//   {
//     "id": "9MraFFrDEOTGh8ouSkYX",
//     "content": "¿Quién de nosotros es en realidad un robot?",
//     "index": 56
//   },
//   {
//     "id": "5ejn5dCyJ9NrVXCsPAZy",
//     "content":
//         "¿Quién se pide plata prestada sabiendo que nunca la va a devolver?",
//     "index": 57
//   },
//   {
//     "id": "hF4PBYRTYw8bPKvK1OPs",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 58
//   },
//   {
//     "id": "zZpvmu04KfTXrp5SAzWn",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 59
//   },
//   {
//     "id": "VdxpikrxBFQPL1Bio9Ht",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 60
//   },
//   {
//     "id": "VODASpfIPZfDeU1TuvsU",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 61
//   },
//   {
//     "id": "gC4d7ppVa0IbO0QceYDA",
//     "content": "¿A quién de nosotros no te animarías a hacer enojar?",
//     "index": 62
//   },
//   {
//     "id": "A9Gxq45XqqqaCpjnTyNc",
//     "content": "¿Quién lee la Biblia?",
//     "index": 63
//   },
//   {
//     "id": "z9dw0lBoWLBywXLWK6lF",
//     "content":
//         "Vamos a jugar a un juego nuevo. ¿Quién tarda más en entender las reglas?",
//     "index": 64
//   },
//   {
//     "id": "sSKv3EbJ1eJ3okzl4K51",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 65
//   },
//   {
//     "id": "RG6NW8fPXgHZCKFqLDxb",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 66
//   },
//   {
//     "id": "98HIg266KQ5YnPYI5Vnf",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 67
//   },
//   {
//     "id": "d4aK1KHigXNPt3OuIUIz",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 68
//   },
//   {
//     "id": "AynfOTuqJDJ8N2VCguhP",
//     "content":
//         "¿Quién de nosotros no entiende la gracia de este juego, pero se ríe de compromiso para no quedar como el ojete? ¿Quién?",
//     "index": 69
//   },
//   {
//     "id": "6VhElEm0JMR4Xd8n40VT",
//     "content":
//         "Necesitamos a alguien para comandar a nuestras tropas. Por favor, que no sea... ¿Quién?",
//     "index": 70
//   },
//   {
//     "id": "OLyja8Fs7tbH0naqnHH5",
//     "content":
//         "Uno de nosotros se hace el boludo, pero está secretamente resentido por el resultado de otra tarjeta. ¿Quién?",
//     "index": 71
//   },
//   {
//     "id": "eQrzSq9Dwxu8Sw5xhmra",
//     "content": "¿Quién de nosotros es en realidad un robot?",
//     "index": 72
//   },
//   {
//     "id": "pgeXKTJq7Zj4v9laqRfB",
//     "content":
//         "¿Quién se pide plata prestada sabiendo que nunca la va a devolver?",
//     "index": 73
//   },
//   {
//     "id": "2wPm7KfPkCDkzgnHtOee",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 74
//   },
//   {
//     "id": "dHqCJtxSWeIrBJjH6V2z",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 75
//   },
//   {
//     "id": "dC3artHEai1sJex9eYwg",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 76
//   },
//   {
//     "id": "b4YgtDwmDl3GbA39dBZM",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 77
//   },
//   {
//     "id": "E60xum2zg9qkKEQENcJB",
//     "content": "¿A quién de nosotros no te animarías a hacer enojar?",
//     "index": 78
//   },
//   {
//     "id": "us1GCVT3K1VbfY1we9nm",
//     "content": "¿Quién lee la Biblia?",
//     "index": 79
//   },
//   {
//     "id": "0isT8Qyv6blRrFKSamCB",
//     "content":
//         "Vamos a jugar a un juego nuevo. ¿Quién tarda más en entender las reglas?",
//     "index": 80
//   },
//   {
//     "id": "T8mFen64cfRpxVIW4GLH",
//     "content":
//         "De ahora en más, siempre que tengas un orgasmo, vas a ver la cara de uno de nosotros. Ojalá que no sea la de...",
//     "index": 81
//   },
//   {
//     "id": "HFTEeMlDiuUnSfBUI6U9",
//     "content": "¿Quién de nosotros JAMÁS participaría en una orgía?",
//     "index": 82
//   },
//   {
//     "id": "8tDxC4bfH4Ktag6iYCbu",
//     "content":
//         "Uno de nosotros lo excita la idea de acostarse con personas casadas. ¿A quién?",
//     "index": 83
//   },
//   {
//     "id": "N4umAgrFtjbp1BVSn7uR",
//     "content":
//         "Uno de nosotros se masturba pensando en el/la presidente. ¿Quién?",
//     "index": 84
//   },
//   {
//     "id": "cIexYvcnbmYQ5MPrInkW",
//     "content":
//         "Los genitales de uno de nosotros son el molde de juguetes sexuales. ¿Los de quién?",
//     "index": 85
//   },
//   {
//     "id": "eSKYXm16Zx3datHG7EnF",
//     "content":
//         "Uno de nosotros es, secretamente, una estrella porno conocida como \"Beso Negro\" Jones. ¿Quién?",
//     "index": 86
//   },
//   {
//     "id": "ar9EBme31zLl6E5szZu4",
//     "content":
//         "Por un millón de dólares, uno de nosotros se cogería a uno de sus padres. ¿Quién?",
//     "index": 87
//   },
//   {
//     "id": "e4INRN572ZxS1UEF9ABl",
//     "content":
//         "Uno de nosotros es MUY irresponsable a la hora de cuidarse durante el sexo. ¿Quién?",
//     "index": 88
//   },
//   {
//     "id": "H9JZ7AA0fUNLhPXNbQRH",
//     "content":
//         "¿A quién le daría menos culpa acostarse con la expareja de un amigo?",
//     "index": 89
//   },
//   {
//     "id": "FGBAKHfniw3caYeT1cVf",
//     "content": "Uno de nosotros tuvo gonorrea, clamidia y sífilis. ¿Quién?",
//     "index": 90
//   },
//   {
//     "id": "aoFegdaYk8fhqYhQB03W",
//     "content":
//         "De ahora en más, siempre que tengas un orgasmo, vas a ver la cara de uno de nosotros. Ojalá que no sea la de...",
//     "index": 91
//   },
//   {
//     "id": "PcT1HwBRzaGULE1rqcwd",
//     "content":
//         "Volvemos de vacaciones y uno de nosotros tiene unos kilitos de más. ¿Quién se lo hace notar inmediatamente?",
//     "index": 92
//   },
//   {
//     "id": "Kdig0CKq1ZhEYXnEu3dy",
//     "content":
//         "Cada uno publica un libro con su propia autobiografía. ¿Cuál te interesa menos?",
//     "index": 93
//   },
//   {
//     "id": "1eQ7ozM23NgjNjLgvChL",
//     "content": "¿Quién de nosotros tendría SEXO CON UN animal?",
//     "index": 94
//   },
//   {
//     "id": "G7BA0qsrDJqoYT0dMgfN",
//     "content": "¿Quién de nosotros se masturbó más veces el año pasado?",
//     "index": 95
//   },
//   {
//     "id": "3h4tkxx0fmoLFyTqbofO",
//     "content": "Uno de ustedes quiere garchar conmigo. ¿Quién?",
//     "index": 96
//   },
//   {
//     "id": "7G652zVSvTN3TOpwUND7",
//     "content":
//         "Uno de nosotros es MUY irresponsable a la hora de cuidarse durante el sexo. ¿Quién?",
//     "index": 97
//   },
//   {
//     "id": "s7UrHgvRScLgtinY0WAd",
//     "content": "¿Con quién de nosotros JAMÁS participarías en un trío?",
//     "index": 98
//   },
//   {
//     "id": "YxvbIHGVs9yCNP1xxRIc",
//     "content":
//         "¿En el historial porno de quién encontraríamos las cosas más raras?",
//     "index": 99
//   },
//   {
//     "id": "Md6Li6QRXDtEjWQ8Dw06",
//     "content":
//         "Uno de nosotros está enamorado secretamente de otro de nosotros. ¿Quién?",
//     "index": 100
//   },
//   {
//     "id": "T9dZYDpJPVTnuPvtBJHZ",
//     "content": "¿Quién se clona para poder coger consigo mismo?",
//     "index": 101
//   },
//   {
//     "id": "ggX5fzAPugn4dVdN6drp",
//     "content": "¿A quién le da asquito hacer sexo oral?",
//     "index": 102
//   },
//   {
//     "id": "Yrrq9thqsQ0coAuLPA8w",
//     "content": "¿Quién es el más egoísta en la cama?",
//     "index": 103
//   },
//   {
//     "id": "szegAO48cdokzOW6vjLM",
//     "content":
//         "¿A quién le encantaría organizar una orgía entre nosotros ahora mismo?",
//     "index": 104
//   },
//   {
//     "id": "yYonrzcfhUeTi10O8mB1",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 105
//   },
//   {
//     "id": "wBoFRJDqb0zDorzoFGsf",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 106
//   },
//   {
//     "id": "P6UbV7RyHDjDki6bhp0s",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 107
//   },
//   {
//     "id": "LgoH1nSV2Usw4neblntZ",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 108
//   },
//   {
//     "id": "YUQDoWTSgUgbtVrChRIZ",
//     "content":
//         "¿Quién de nosotros no entiende la gracia de este juego, pero se ríe de compromiso para no quedar como el ojete? ¿Quién?",
//     "index": 109
//   },
//   {
//     "id": "IEWpmSP9S0nggjJTAMew",
//     "content":
//         "Necesitamos a alguien para comandar a nuestras tropas. Por favor, que no sea... ¿Quién?",
//     "index": 110
//   },
//   {
//     "id": "TrgpztEwZiLIYgXaZXN7",
//     "content":
//         "Uno de nosotros se hace el boludo, pero está secretamente resentido por el resultado de otra tarjeta. ¿Quién?",
//     "index": 111
//   },
//   {
//     "id": "K07zQIEWdnYp13Bg7Pu2",
//     "content": "¿Quién de nosotros es en realidad un robot?",
//     "index": 112
//   },
//   {
//     "id": "HVLBy7IS6CODIXFX9nyA",
//     "content":
//         "¿Quién se pide plata prestada sabiendo que nunca la va a devolver?",
//     "index": 113
//   },
//   {
//     "id": "AZFcfkg5JG3433O5vx1B",
//     "content": "Uno de nosotros tiene un hijo no reconocido. ¿Quién?",
//     "index": 114
//   },
//   {
//     "id": "avAUjfgUhQixcCmc7Efs",
//     "content": "Uno de nosotros tiene una doble vida. ¿Quién?",
//     "index": 115
//   },
//   {
//     "id": "U2l7prrEES75DxqSW4tY",
//     "content":
//         "Nos acabamos de enterar de un secreto tremendo. ¿Quién es el primero en contarlo?",
//     "index": 116
//   },
//   {
//     "id": "sR9bDWifAV8jLaQegef3",
//     "content":
//         "El día que la ciencia descubra cómo agregarnos otro set de genitales, ¿quién es el primero en la fila?",
//     "index": 117
//   },
//   {
//     "id": "L9BVxrrNQbtT8GTjYWZc",
//     "content": "¿A quién de nosotros no te animarías a hacer enojar?",
//     "index": 118
//   },
//   {
//     "id": "SDcQwVazOLNo45CidAny",
//     "content": "¿Quién lee la Biblia?",
//     "index": 119
//   },
//   {
//     "id": "xeYJsyOtKH1B1aJny12P",
//     "content":
//         "Vamos a jugar a un juego nuevo. ¿Quién tarda más en entender las reglas?",
//     "index": 120
//   }
// ];
// final List<Map<String, dynamic>> retos = [
//   {"id": "kNj840LIrbTTkTUfG5oa", "content": "Toma 2 sorbos.", "index": 1},
//   {
//     "id": "Og1YMF567HkkLrZNd3tP",
//     "content":
//         "Imita a alguien en la habitación durante 30 segundos o toma 3 sorbos.",
//     "index": 2
//   },
//   {
//     "id": "2mcXzWCXZnk2LgGHvonb",
//     "content": "Toma 1 sorbo por cada persona en la mesa.",
//     "index": 3
//   },
//   {
//     "id": "fogAVCNrKIL2haBKRndb",
//     "content": "Elige a alguien y ambos toman 3 sorbos.",
//     "index": 4
//   },
//   {
//     "id": "aia1zVIlkLJSUo0p8G7A",
//     "content": "Canta una canción durante 10 segundos o toma 2 sorbos.",
//     "index": 5
//   },
//   {
//     "id": "KMBkEbr2S4Vz3hn9crw6",
//     "content": "Toma 2 sorbos si alguna vez has llorado viendo una película.",
//     "index": 6
//   },
//   {
//     "id": "hg4Z5llPGbh5sNuuIg42",
//     "content": "Toma 1 sorbo si alguna vez has dicho \"te quiero\" por error.",
//     "index": 7
//   },
//   {
//     "id": "gAoOGKh5SfAbqAsj4O3P",
//     "content": "Cuenta una historia embarazosa o toma 4 sorbos.",
//     "index": 8
//   },
//   {
//     "id": "PLfLmpbJE4p4xZfit2zr",
//     "content":
//         "Toma 3 sorbos si has perdido alguna vez tu teléfono mientras estaba en tu mano.",
//     "index": 9
//   },
//   {
//     "id": "k1rcWJjFTZbNpW2fxttP",
//     "content": "Toma 2 sorbos si alguna vez te has quedado dormido en público.",
//     "index": 10
//   },
//   {
//     "id": "swWQ8Cul60vWtrAHW7lE",
//     "content": "Si no sabes decir un trabalenguas, toma 3 sorbos.",
//     "index": 11
//   },
//   {
//     "id": "Bey9oonSANTTRxzOieZk",
//     "content":
//         "Elige a alguien para intercambiar bebidas durante el próximo reto.",
//     "index": 12
//   },
//   {
//     "id": "mhffSX5yy3ZiZqoyu2Yc",
//     "content": "Toma 1 sorbo por cada anillo o pulsera que lleves.",
//     "index": 13
//   },
//   {
//     "id": "IyeE81dWhobdKCYmXgHe",
//     "content": "Toma 2 sorbos si alguna vez has roto algo y lo has ocultado.",
//     "index": 14
//   },
//   {
//     "id": "oDTZqMy3kHqV7HJal56o",
//     "content":
//         "Haz una mueca graciosa. Si alguien ríe, toma 2 sorbos. Si no, toma 4.",
//     "index": 15
//   },
//   {
//     "id": "8n45o6iSUrNI3Ce6hGd5",
//     "content":
//         "Toma 3 sorbos si tienes más de 5 apps abiertas en tu teléfono ahora mismo.",
//     "index": 16
//   },
//   {
//     "id": "bcGK49C8qDqZ6mjudGhU",
//     "content": "Si alguna vez te has caído en público, toma 2 sorbos.",
//     "index": 17
//   },
//   {
//     "id": "Jc1TudcE6dggpqOWtAvK",
//     "content":
//         "Toma 1 sorbo si has olvidado el cumpleaños de alguien importante.",
//     "index": 18
//   },
//   {
//     "id": "VfZCuu3UVPozQcLrI4gP",
//     "content":
//         "Si tienes alguna foto vergonzosa guardada en tu teléfono, toma 3 sorbos.",
//     "index": 19
//   },
//   {
//     "id": "c618d7PHcMggef6i6LHz",
//     "content": "Toma 2 sorbos y cambia de asiento con alguien de tu elección.",
//     "index": 20
//   }
// ];

// Future<void> seedGames() async {
//   for (GameModel game in games) {
//     await DatabaseService().addGame(game);
//   }
// }

// Future<void> seedDecks() async {
//   for (DeckModel deck in decks) {
//     // await DatabaseService().addDeck(gameId: "SI1kIH2TPgdNymu0UXdl", deck: deck);
//   }
// }

// Future<void> seedCards() async {
//   for (int i = 0; i < retos.length; i++) {
//     // await DatabaseService().addCard(
//     //   gameId: "SI1kIH2TPgdNymu0UXdl",
//     //   deckId: "qkEoBPVaOSA5iXo51Cfy",
//     //   cardMap: retos[i],
//     // );
//   }
// }
