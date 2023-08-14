import 'package:flutter/material.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:jomtender/app_theme.dart';
import '../class/elements.dart';

final List<Tender> _tenders = <Tender>[
  Tender(DateTime(2020, 6, 24, 18), 'Got to gym', Icons.fitness_center),
  Tender(DateTime(2020, 6, 24, 9), 'Work', Icons.work),
  Tender(DateTime(2020, 6, 25, 8), 'Buy groceries', Icons.shopping_basket),
  Tender(DateTime(2020, 6, 25, 16), 'Cinema', Icons.movie),
  Tender(DateTime(2020, 6, 25, 20), 'Eat', Icons.fastfood),
  Tender(DateTime(2020, 6, 26, 12), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 27, 12), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 27, 13), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 27, 14), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 27, 15), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 28, 12), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 29, 12), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 29, 12), 'Car wash', Icons.local_car_wash),
  Tender(DateTime(2020, 6, 30, 12), 'Car wash', Icons.local_car_wash),
];

class StickyGroupView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const StickyGroupView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StickyGroupedListView<Tender, DateTime>(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              elements: _tenders,
              order: StickyGroupedListOrder.ASC,
              groupBy: (Tender tender) => DateTime(
                tender.date.year,
                tender.date.month,
                tender.date.day,
              ),
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              itemComparator: (Tender tender1, Tender tender2) =>
                  tender1.date.compareTo(tender2.date),
              floatingHeader: true,
              groupSeparatorBuilder: _getGroupSeparator,
              itemBuilder: _getItem,
            ),
          );
        });
  }

  Widget _getGroupSeparator(Tender tender) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            border: Border.all(
              color: Colors.blue[300]!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${tender.date.day}/ ${tender.date.month}/ ${tender.date.year}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getItem(BuildContext ctx, Tender tender) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.only(top: 16, left: 16, right: 24),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.favorite_outline_outlined,
                                color: AppTheme.nearlyDarkRed.withOpacity(0.5),
                                size: 32,
                              ),
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
              padding:
                  const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
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
                            color: AppTheme.nearlyDarkBlue.withOpacity(0.5),
                            size: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              '${tender.date.day} / ${tender.date.month} / ${tender.date.year}',
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
                            color: AppTheme.nearlyDarkRed.withOpacity(0.5),
                            size: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              '${tender.date.day} / ${tender.date.month} / ${tender.date.year}',
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
                            color: AppTheme.nearlyBlack.withOpacity(0.5),
                            size: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              '${tender.date.day} / ${tender.date.month} / ${tender.date.year}',
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
