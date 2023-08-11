import 'package:flutter/material.dart';
import 'package:jomtender/app_theme.dart';
import '../class/events.dart';

TextStyle style = TextStyle(color: Colors.white);

class TimelineView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  TimelineView({Key? key, this.animationController, this.animation})
      : super(key: key);
  final String? title = 'Timeline';

  final List<Events> listOfEvents = [
    Events(
        time: "12/12/21 10:00 AM",
        eventName: "Diterbitkan",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc luctus orci metus, eu varius libero mollis nec. Nulla elementum nisl eu est luctus sodales. Curabitur id euismod lacus. Nulla maximus tortor id justo egestas pellentesque. Sed pellentesque volutpat ipsum non tempor"),
    Events(
        time: "12/12/21 4PM", eventName: "Disahkan", description: "Hangouts"),
    Events(
        time: "13/12/21 9AM",
        eventName: "Diluluskan",
        description: "Main Room"),
    Events(time: "13/12/21 11AM", eventName: "Arkib", description: "Web App"),
  ];

  final List<Color> listOfColors = [
    AppTheme.palleteGreen,
    AppTheme.palleteBlue,
    AppTheme.palleteYellow,
    AppTheme.palleteRed,
    AppTheme.palleteGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: AppTheme.nearlyBlack.withOpacity(0.5),
                              size: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(),
                            ),
                            Flexible(
                              child: Text(
                                "JABATAN PENGAIRAN DAN SALIRAN SARAWAK",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: false,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  letterSpacing: -0.2,
                                  color: AppTheme.darkText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfEvents.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 24, left: 24),
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: getNewTimeLine(context, i)),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getNewTimeLine(BuildContext context, i) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 100,
              width: 50,
            ),
            Positioned(
              left: 25,
              child: Container(
                height: size.height * 0.7,
                width: 1.0,
                color: Colors.grey.shade400,
              ),
            ),
            Positioned(
              bottom: 25,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 10, bottom: 15, right: 10),
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    color: listOfColors[i],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 75,
          child: Text(listOfEvents[i].time),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(listOfEvents[i].eventName),
              Text(
                listOfEvents[i].description,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 6,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}
