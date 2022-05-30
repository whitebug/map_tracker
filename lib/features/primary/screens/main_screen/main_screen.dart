import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_tracker/assets/colors/colors.dart';
import 'package:map_tracker/assets/themes/text_style.dart';
import 'package:map_tracker/features/common/widgets/loading_widget.dart';
import 'package:map_tracker/features/primary/screens/main_screen/main_screen_widget_model.dart';
import 'package:map_tracker/features/primary/service/model/map_features.dart';
import 'package:map_tracker/features/primary/service/model/menu_item.dart';
import 'package:map_tracker/features/primary/widgets/dropdown_menu_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

/// Initialization screens.
class MainScreen extends ElementaryWidget<IMainWidgetModel> {
  /// Create an instance [MainScreen].
  const MainScreen({
    Key? key,
    WidgetModelFactory wmFactory = mainScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMainWidgetModel wm) {
    return Scaffold(
      body: StateNotifierBuilder<MapFeatures>(
        listenableState: wm.features,
        builder: (context, features) {
          final Size _mainSize = MediaQuery.of(context).size;
          if (features != null) {
            return Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    center: features.center,
                    zoom: features.zoom,
                    maxZoom: 18.25,
                  ),
                  layers: [
                    features.mapType,
                    MarkerLayerOptions(markers: features.markers),
                  ],
                ),
                Positioned(
                  top: 30.0,
                  left: 30.0,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: DropdownMenuWidget(
                      icon: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: mainMenuButtonDecoration,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.list,
                            size: 46,
                            color: white,
                          ),
                        ),
                      ),
                      items: wm.mainMenuItems,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: white,
                      ),
                      onChanged: (value) {
                        wm.mainMenuOnChanged(value as MapMenuItem);
                      },
                    ),
                  ),
                ),
                SlidingUpPanel(
                  panel: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          features.placeMark.name,
                          style: textMedium20,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          features.placeMark.description,
                          style: textRegular,
                        ),
                      ],
                    ),
                  ),
                  minHeight: 0,
                  maxHeight: _mainSize.height * 0.8,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  backdropEnabled: true,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  controller: wm.panelController,
                ),
              ],
            );
          } else {
            return const LoadingWidget(
              width: 40.0,
              height: 40.0,
            );
          }
        },
      ),
    );
  }
}
