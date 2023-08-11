import 'package:flutter/material.dart';
import 'package:jomtender/app_theme.dart';
import 'package:intl/intl.dart';

class ProcurementView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ProcurementView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());

    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Cadangan Kerja Kerja Membina Parkir Berbumbung Jentera Berat',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: AppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite_outline_outlined,
                                        color: AppTheme.nearlyDarkRed
                                            .withOpacity(0.5),
                                        size: 32,
                                      ),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 4.0),
                                      //   child: Text(
                                      //     'Kegemaran',
                                      //     textAlign: TextAlign.center,
                                      //     style: TextStyle(
                                      //         fontFamily: AppTheme.fontName,
                                      //         fontWeight: FontWeight.w500,
                                      //         fontSize: 20,
                                      //         letterSpacing: 0.0,
                                      //         color: AppTheme.grey),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: AppTheme.nearlyDarkBlue
                                        .withOpacity(0.5),
                                    size: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      date,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: AppTheme.darkText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Tarikh Buka',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color:
                                        AppTheme.nearlyDarkRed.withOpacity(0.5),
                                    size: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      date,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: AppTheme.darkText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Tarikh Tutup',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color:
                                        AppTheme.nearlyBlack.withOpacity(0.5),
                                    size: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      date,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: AppTheme.darkText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Tarikh Kemaskini',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Expanded(
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             Icons.access_time,
                          //             color: AppTheme.nearlyDarkRed
                          //                 .withOpacity(0.5),
                          //             size: 12,
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.all(4.0),
                          //             child: Expanded(
                          //               child: Text(
                          //                 date,
                          //                 overflow: TextOverflow.ellipsis,
                          //                 maxLines: 1,
                          //                 softWrap: false,
                          //                 textAlign: TextAlign.start,
                          //                 style: TextStyle(
                          //                   fontFamily: AppTheme.fontName,
                          //                   fontWeight: FontWeight.w500,
                          //                   fontSize: 12,
                          //                   letterSpacing: -0.2,
                          //                   color: AppTheme.darkText,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 6),
                          //         child: Text(
                          //           'Tarikh Tutup',
                          //           textAlign: TextAlign.center,
                          //           style: TextStyle(
                          //             fontFamily: AppTheme.fontName,
                          //             fontWeight: FontWeight.w600,
                          //             fontSize: 12,
                          //             color: AppTheme.grey.withOpacity(0.5),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             Icons.access_time,
                          //             color: AppTheme.darkGrey.withOpacity(0.5),
                          //             size: 12,
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.all(4.0),
                          //             child: Expanded(
                          //               child: Text(
                          //                 date,
                          //                 overflow: TextOverflow.ellipsis,
                          //                 maxLines: 1,
                          //                 softWrap: false,
                          //                 textAlign: TextAlign.start,
                          //                 style: TextStyle(
                          //                   fontFamily: AppTheme.fontName,
                          //                   fontWeight: FontWeight.w500,
                          //                   fontSize: 12,
                          //                   letterSpacing: -0.2,
                          //                   color: AppTheme.darkText,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 6),
                          //         child: Text(
                          //           'Tarikh Kemaskini',
                          //           textAlign: TextAlign.center,
                          //           style: TextStyle(
                          //             fontFamily: AppTheme.fontName,
                          //             fontWeight: FontWeight.w600,
                          //             fontSize: 12,
                          //             color: AppTheme.grey.withOpacity(0.5),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
