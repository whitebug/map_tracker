import 'package:flutter/material.dart';

import 'menu_item.dart';

/// Items for the main menu
class MainMenuItems {
  static const List<MapMenuItem> firstItems = [kmz, share, settings];
  static const List<MapMenuItem> secondItems = [logout];
  static const kmz = MapMenuItem(text: 'Считать kml файл', icon: Icons.home);
  static const share = MapMenuItem(text: 'Поделиться', icon: Icons.share);
  static const settings = MapMenuItem(text: 'Настройки', icon: Icons.settings);
  static const logout = MapMenuItem(text: 'Выйти', icon: Icons.logout);
}
