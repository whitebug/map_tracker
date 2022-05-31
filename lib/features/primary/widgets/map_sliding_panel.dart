import 'package:flutter/material.dart';
import 'package:map_tracker/assets/colors/colors.dart';
import 'package:map_tracker/assets/themes/text_style.dart';
import 'package:map_tracker/features/primary/service/entity/entity.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

/// Stop point in the middle
const double snapPoint = 0.2;

/// Sliding up panel
class MapSlidingPanel extends StatelessWidget {
  const MapSlidingPanel({
    required this.placeMark,
    required this.panelController,
    Key? key,
  }) : super(key: key);

  /// Selected [PlaceMarkEntity]
  final PlaceMarkEntity placeMark;

  /// Controller for the [SlidingUpPanel]
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    final Size _mainSize = MediaQuery.of(context).size;
    return SlidingUpPanel(
      snapPoint: snapPoint,
      panelBuilder: (ScrollController scrollController) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(
              child: Center(
                child: SizedBox(
                  width: 40.0,
                  height: 4.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: hintColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              placeMark.name,
              style: textMedium20,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Координаты: ${placeMark.latitude} ${placeMark.longitude}',
              style: textRegular,
            ),
            const SizedBox(height: 10.0),
            Text(
              placeMark.description,
              style: textRegular,
            ),
          ],
        ),
      ),
      minHeight: 0,
      maxHeight: _mainSize.height * 0.9,
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      controller: panelController,
      onPanelSlide: (d) {
        print(d);
      },
    );
  }
}
