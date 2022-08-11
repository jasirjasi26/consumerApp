// import 'package:flutter/material.dart';
// import 'package:adobe_xd/pinned.dart';
// import 'package:adobe_xd/page_link.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class Tables extends StatefulWidget {
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Tables>{
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       body: Stack(
//         children: <Widget>[
//           Pinned.fromPins(
//             Pin(size: 47.4, end: 21.9),
//             Pin(size: 9.1, start: 15.0),
//             child: Stack(
//               children: <Widget>[
//                 Pinned.fromPins(
//                   Pin(size: 15.1, end: 0.0),
//                   Pin(start: 1.0, end: 0.0),
//                   child:
//                       // Adobe XD layer: 'surface1' (group)
//                       Stack(
//                     children: <Widget>[
//                       Pinned.fromPins(
//                         Pin(start: 0.0, end: 0.0),
//                         Pin(start: 0.0, end: 0.0),
//                         child: SvgPicture.string(
//                           _svg_itaqu0,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 10.5, middle: 0.4134),
//                   Pin(start: 0.0, end: 1.0),
//                   child:
//                       // Adobe XD layer: 'surface1' (group)
//                       Stack(
//                     children: <Widget>[
//                       Pinned.fromPins(
//                         Pin(start: 0.0, end: 0.0),
//                         Pin(start: 0.0, end: 0.0),
//                         child: SvgPicture.string(
//                           _svg_m17u6,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 9.1, start: 0.0),
//                   Pin(start: 0.0, end: 0.0),
//                   child:
//                       // Adobe XD layer: 'surface1' (group)
//                       Stack(
//                     children: <Widget>[
//                       Pinned.fromPins(
//                         Pin(start: 0.0, end: 0.0),
//                         Pin(start: 0.0, end: 0.0),
//                         child: SvgPicture.string(
//                           _svg_vg44vx,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 70.0, start: 36.0),
//             Pin(size: 11.0, middle: 0.3405),
//             child: Text(
//               'Choose Table :',
//               style: TextStyle(
//                 fontFamily: 'Arial',
//                 fontSize: 10,
//                 color: const Color(0xff8c8c8c),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(start: 30.0, end: 44.0),
//             Pin(size: 44.0, middle: 0.5),
//             child: PageLink(
//               links: [
//                 // PageLinkInfo(
//                 //   ease: Curves.easeOut,
//                 //   duration: 0.8,
//                 //   pageBuilder: () => scancode19(),
//                 // ),
//               ],
//               child: Stack(
//                 children: <Widget>[
//                   Pinned.fromPins(
//                     Pin(start: 0.0, end: 0.0),
//                     Pin(start: 0.0, end: 0.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4.0),
//                         gradient: LinearGradient(
//                           begin: Alignment(-0.95, 0.0),
//                           end: Alignment(1.0, 0.0),
//                           colors: [
//                             const Color(0xff005fb8),
//                             const Color(0xff60cdff)
//                           ],
//                           stops: [0.0, 1.0],
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0x29000000),
//                             offset: Offset(0, 3),
//                             blurRadius: 6,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Pinned.fromPins(
//                     Pin(size: 55.0, middle: 0.5022),
//                     Pin(size: 11.0, middle: 0.5152),
//                     child: Text(
//                       'CONTINUE ',
//                       style: TextStyle(
//                         fontFamily: 'Arial',
//                         fontSize: 10,
//                         color: const Color(0xffffffff),
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 178.0, middle: 0.5),
//             Pin(size: 22.0, middle: 0.187),
//             child: Text(
//               'Choose your Table',
//               style: TextStyle(
//                 fontFamily: 'Arial',
//                 fontSize: 20,
//                 color: const Color(0xff000000),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(start: 33.0, end: 41.0),
//             Pin(size: 44.0, middle: 0.3869),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4.0),
//                 color: const Color(0xffffffff),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0x29000000),
//                     offset: Offset(0, 3),
//                     blurRadius: 6,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 58.0, middle: 0.3675),
//             Pin(size: 11.0, middle: 0.3925),
//             child: Text(
//               'Select Table',
//               style: TextStyle(
//                 fontFamily: 'Arial',
//                 fontSize: 10,
//                 color: const Color(0xff000000),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 25.0, start: 48.0),
//             Pin(size: 23.0, middle: 0.3894),
//             child: SvgPicture.string(
//               _svg_fvttxb,
//               allowDrawingOutsideViewBox: true,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 14.2, start: 53.4),
//             Pin(size: 10.3, middle: 0.3913),
//             child:
//                 // Adobe XD layer: 'surface1' (group)
//                 Stack(
//               children: <Widget>[
//                 Pinned.fromPins(
//                   Pin(start: 0.0, end: 0.0),
//                   Pin(size: 1.6, start: 0.0),
//                   child: SvgPicture.string(
//                     _svg_xhni3k,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 1.6, start: 1.2),
//                   Pin(size: 8.7, end: 0.0),
//                   child: SvgPicture.string(
//                     _svg_u4kja0,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 1.6, end: 1.2),
//                   Pin(size: 8.7, end: 0.0),
//                   child: SvgPicture.string(
//                     _svg_lsz6bf,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(start: 2.8, end: 2.8),
//                   Pin(size: 2.0, middle: 0.1905),
//                   child: SvgPicture.string(
//                     _svg_sdzs9,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 17.0, middle: 0.8047),
//             Pin(size: 17.0, middle: 0.3917),
//             child:
//                 // Adobe XD layer: 'Layer 2' (group)
//                 Stack(
//               children: <Widget>[
//                 Pinned.fromPins(
//                   Pin(start: 0.0, end: 0.0),
//                   Pin(start: 0.0, end: 0.0),
//                   child:
//                       // Adobe XD layer: 'invisible box' (group)
//                       Stack(
//                     children: <Widget>[
//                       Pinned.fromPins(
//                         Pin(start: 0.0, end: 0.0),
//                         Pin(start: 0.0, end: 0.0),
//                         child: Container(
//                           decoration: BoxDecoration(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 10.1, middle: 0.5209),
//                   Pin(size: 5.8, middle: 0.5125),
//                   child:
//                       // Adobe XD layer: 'icons Q2' (group)
//                       Stack(
//                     children: <Widget>[
//                       Pinned.fromPins(
//                         Pin(start: 0.0, end: 0.0),
//                         Pin(start: 0.0, end: 0.0),
//                         child: SvgPicture.string(
//                           _svg_gnws7m,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 238.0, middle: 0.5),
//             Pin(size: 16.0, end: 9.0),
//             child: Stack(
//               children: <Widget>[
//                 Pinned.fromPins(
//                   Pin(start: 0.0, end: 0.0),
//                   Pin(start: 0.0, end: 0.0),
//                   child: Text(
//                     'Copyright      2021 ZRES. All Rights Reserved.',
//                     style: TextStyle(
//                       fontFamily: 'Segoe UI',
//                       fontSize: 12,
//                       color: const Color(0xffcfcfcf),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 12.4, middle: 0.2615),
//                   Pin(start: 1.6, end: 2.0),
//                   child:
//                       // Adobe XD layer: 'surface1' (group)
//                       Stack(
//                     children: <Widget>[
//                       Pinned.fromPins(
//                         Pin(start: 0.0, end: 0.0),
//                         Pin(start: 0.0, end: 0.0),
//                         child: SvgPicture.string(
//                           _svg_e95m0o,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Pinned.fromPins(
//             Pin(size: 64.0, middle: 0.3953),
//             Pin(size: 20.0, end: 36.0),
//             child: Stack(
//               children: <Widget>[
//                 Pinned.fromPins(
//                   Pin(size: 52.0, start: 0.0),
//                   Pin(start: 0.0, end: 0.0),
//                   child: Text(
//                     'Zclipse',
//                     style: TextStyle(
//                       fontFamily: 'Blackoak Std',
//                       fontSize: 15,
//                       color: const Color(0xff000000),
//                       fontWeight: FontWeight.w900,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 Pinned.fromPins(
//                   Pin(size: 5.0, end: 0.0),
//                   Pin(size: 2.0, middle: 0.2778),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xff000000),
//                       border: Border.all(
//                           width: 1.0, color: const Color(0xff60cdff)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// const String _svg_itaqu0 =
//     '<svg viewBox="3.0 8.0 15.1 8.1" ><path  d="M 3 8 L 3 16.06108093261719 L 16.94588470458984 16.06108093261719 L 16.94588470458984 13.54199314117432 L 18.10804176330566 13.54199314117432 L 18.10804176330566 10.51908779144287 L 16.94588470458984 10.51908779144287 L 16.94588470458984 8 L 3 8 Z M 4.16215705871582 9.007635116577148 L 15.78372955322266 9.007635116577148 L 15.78372955322266 15.05344486236572 L 4.16215705871582 15.05344486236572 L 4.16215705871582 9.007635116577148 Z M 5.324314594268799 10.0152702331543 L 5.324314594268799 14.04581069946289 L 14.62157154083252 14.04581069946289 L 14.62157154083252 10.0152702331543 L 5.324314594268799 10.0152702331543 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_m17u6 =
//     '<svg viewBox="0.8 3.0 10.5 8.1" ><path transform="translate(0.0, 0.0)" d="M 6.013288021087646 2.953129768371582 C 4.048573017120361 2.953129768371582 2.289513349533081 3.711136817932129 0.9774444699287415 4.975619316101074 C 0.7225077152252197 5.223760604858398 0.7174092531204224 5.631658554077148 0.9638478755950928 5.886591911315918 C 1.211984634399414 6.141550064086914 1.619882345199585 6.146640777587891 1.87481951713562 5.900187492370605 C 2.962547063827515 4.851553440093994 4.374891757965088 4.239706993103027 6.013288021087646 4.239706993103027 C 7.649970054626465 4.239706993103027 9.062318801879883 4.851553440093994 10.15004634857178 5.900187492370605 C 10.4049654006958 6.146640777587891 10.81286334991455 6.141550064086914 11.06103897094727 5.886591911315918 C 11.30917358398438 5.631658554077148 11.30234050750732 5.223760604858398 11.04742050170898 4.975619316101074 C 9.735361099243164 3.711136817932129 7.976288318634033 2.953129768371582 6.013288021087646 2.953129768371582 Z M 6.013288021087646 5.096291542053223 C 4.592436790466309 5.096291542053223 3.309257984161377 5.684343338012695 2.382992744445801 6.608924865722656 C 2.13315486907959 6.860451698303223 2.13315486907959 7.268348693847656 2.382992744445801 7.519874572753906 C 2.634527683258057 7.771401405334473 3.042425155639648 7.771401405334473 3.293964385986328 7.519874572753906 C 3.997589111328125 6.816246032714844 4.947662830352783 6.381155014038086 6.013288021087646 6.381155014038086 C 7.077216148376465 6.381155014038086 8.027279853820801 6.816246032714844 8.730910301208496 7.519874572753906 C 8.98243522644043 7.771401405334473 9.390334129333496 7.771401405334473 9.641860008239746 7.519874572753906 C 9.891732215881348 7.268348693847656 9.891732215881348 6.860451698303223 9.641860008239746 6.608924865722656 C 8.715594291687012 5.684343338012695 7.432424545288086 5.096291542053223 6.013288021087646 5.096291542053223 Z M 6.013288021087646 7.239459037780762 C 5.138015270233154 7.239459037780762 4.329002380371094 7.608242034912109 3.776641607284546 8.216716766357422 C 3.535305023193359 8.478424072265625 3.553996324539185 8.886322021484375 3.815734386444092 9.125969886779785 C 4.079169273376465 9.367315292358398 4.485365390777588 9.348606109619141 4.726706027984619 9.086898803710938 C 5.030939102172852 8.752096176147461 5.513628959655762 8.524326324462891 6.013288021087646 8.524326324462891 C 6.511249542236328 8.524326324462891 6.993939876556396 8.752096176147461 7.298155307769775 9.086898803710938 C 7.53950023651123 9.348606109619141 7.945701122283936 9.367315292358398 8.209148406982422 9.125969886779785 C 8.470856666564941 8.886322021484375 8.489564895629883 8.478424072265625 8.24821949005127 8.216716766357422 C 7.695871829986572 7.608242034912109 6.886863708496094 7.239459037780762 6.013288021087646 7.239459037780762 Z M 6.013288021087646 9.460816383361816 C 5.586680889129639 9.460816383361816 5.236563205718994 9.812630653381348 5.236563205718994 10.23749732971191 C 5.236563205718994 10.66410350799561 5.586680889129639 11.01422119140625 6.013288021087646 11.01422119140625 C 6.438198089599609 11.01422119140625 6.789969444274902 10.66410350799561 6.789969444274902 10.23749732971191 C 6.789969444274902 9.812630653381348 6.438198089599609 9.460816383361816 6.013288021087646 9.460816383361816 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_vg44vx =
//     '<svg viewBox="2.0 2.0 9.1 9.1" ><path transform="translate(0.0, 0.0)" d="M 9.076101303100586 1.984380125999451 L 9.076101303100586 11.04547119140625 L 11.04547119140625 11.04547119140625 L 11.04547119140625 1.984380125999451 L 9.076101303100586 1.984380125999451 Z M 6.711943626403809 4.151525020599365 L 6.711943626403809 11.04547119140625 L 8.682068824768066 11.04547119140625 L 8.682068824768066 4.151525020599365 L 6.711943626403809 4.151525020599365 Z M 4.348541259765625 6.317911148071289 L 4.348541259765625 11.04547119140625 L 6.317911148071289 11.04547119140625 L 6.317911148071289 6.317911148071289 L 4.348541259765625 6.317911148071289 Z M 1.984380125999451 8.485072135925293 L 1.984380125999451 11.04547119140625 L 3.954528331756592 11.04547119140625 L 3.954528331756592 8.485072135925293 L 1.984380125999451 8.485072135925293 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_xhni3k =
//     '<svg viewBox="6.0 11.0 14.2 1.6" ><path  d="M 6 11 L 20.24318313598633 11 L 20.24318313598633 12.58257579803467 L 6 12.58257579803467 L 6 11 Z" fill="#686868" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_u4kja0 =
//     '<svg viewBox="7.2 12.6 1.6 8.7" ><path transform="translate(-1.81, -2.42)" d="M 9 15 L 10.58257579803467 15 L 10.58257579803467 23.70416831970215 L 9 23.70416831970215 L 9 15 Z" fill="#cfcfcf" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_lsz6bf =
//     '<svg viewBox="17.5 12.6 1.6 8.7" ><path transform="translate(-17.53, -2.42)" d="M 35 15 L 36.58257293701172 15 L 36.58257293701172 23.70416831970215 L 35 23.70416831970215 L 35 15 Z" fill="#cfcfcf" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_sdzs9 =
//     '<svg viewBox="8.8 12.6 8.7 2.0" ><path transform="translate(-4.23, -2.42)" d="M 13 15 L 21.70416641235352 15 L 21.70416641235352 16.97821998596191 L 13 16.97821998596191 L 13 15 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_fvttxb =
//     '<svg viewBox="48.0 287.0 25.0 23.0" ><path transform="translate(48.0, 287.0)" d="M 3 0 L 22 0 C 23.6568546295166 0 25 1.343145608901978 25 3 L 25 20 C 25 21.6568546295166 23.6568546295166 23 22 23 L 3 23 C 1.343145608901978 23 0 21.6568546295166 0 20 L 0 3 C 0 1.343145608901978 1.343145608901978 0 3 0 Z" fill="#aaaaaa" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_gnws7m =
//     '<svg viewBox="0.0 0.0 10.1 5.8" ><path transform="translate(-10.0, -15.96)" d="M 15.04345321655273 20.00819206237793 L 11.2253475189209 16.19008636474609 C 11.08488273620605 16.03139686584473 10.87882423400879 15.94673347473145 10.66736507415771 15.96083068847656 C 10.45590782165527 15.97492790222168 10.26291084289551 16.08619499206543 10.14475250244141 16.26212692260742 C 9.928699493408203 16.56058502197266 9.959122657775879 16.97129440307617 10.21679306030273 17.23466110229492 L 14.53917503356934 21.52102661132812 C 14.66879367828369 21.66229820251465 14.85172843933105 21.74271965026855 15.04345321655273 21.74271965026855 C 15.23517799377441 21.74271965026855 15.41811084747314 21.66229820251465 15.54773044586182 21.52102661132812 L 19.87011337280273 17.23466110229492 C 20.12778472900391 16.97129440307617 20.15820693969727 16.56058502197266 19.9421558380127 16.26212692260742 C 19.82399940490723 16.0861930847168 19.63100051879883 15.97492694854736 19.41954231262207 15.96082973480225 C 19.20808410644531 15.9467306137085 19.00202369689941 16.03139495849609 18.86155891418457 16.19008636474609 L 15.04345321655273 20.00819206237793 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_e95m0o =
//     '<svg viewBox="3.0 3.0 12.4 12.4" ><path  d="M 9.200927734375 3 C 5.781846046447754 3 3 5.781846046447754 3 9.200927734375 C 3 12.62002372741699 5.781846046447754 15.40185546875 9.200927734375 15.40185546875 C 12.62002372741699 15.40185546875 15.40185546875 12.62002372741699 15.40185546875 9.200927734375 C 15.40185546875 5.781846046447754 12.62002372741699 3 9.200927734375 3 Z M 9.200927734375 3.953989028930664 C 12.10386753082275 3.953989028930664 14.44786643981934 6.297967910766602 14.44786643981934 9.200927734375 C 14.44786643981934 12.10386753082275 12.10386753082275 14.44786643981934 9.200927734375 14.44786643981934 C 6.297967910766602 14.44786643981934 3.953989028930664 12.10386753082275 3.953989028930664 9.200927734375 C 3.953989028930664 6.297967910766602 6.297967910766602 3.953989028930664 9.200927734375 3.953989028930664 Z M 9.156233787536621 6.338961601257324 C 7.570560455322266 6.338961601257324 6.294242858886719 7.615303039550781 6.294242858886719 9.200927734375 C 6.294242858886719 10.78655242919922 7.570560455322266 12.06289482116699 9.156233787536621 12.06289482116699 C 10.30025768280029 12.06289482116699 11.27847671508789 11.37721538543701 11.73496055603027 10.40834331512451 L 10.8704080581665 10.00585556030273 C 10.56298542022705 10.65986251831055 9.920139312744141 11.10890579223633 9.156233787536621 11.10890579223633 C 8.069926261901855 11.10890579223633 7.248255729675293 10.28718757629395 7.248255729675293 9.200927734375 C 7.248255729675293 8.114668846130371 8.069926261901855 7.292949676513672 9.156233787536621 7.292949676513672 C 9.920139312744141 7.292949676513672 10.56298542022705 7.741992950439453 10.8704080581665 8.395999908447266 L 11.73496055603027 7.993559837341309 C 11.27847671508789 7.024641036987305 10.30025768280029 6.338961601257324 9.156233787536621 6.338961601257324 Z" fill="#cfcfcf" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
