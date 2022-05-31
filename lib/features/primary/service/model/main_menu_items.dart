import 'package:flutter/material.dart';
import 'package:map_tracker/features/primary/service/model/model.dart';

/// Items for the main menu
class MainMenuItems {
  static const List<MapMenuItem> firstItems = [kmz, delete, settings];
  static const List<MapMenuItem> secondItems = [logout];
  static const kmz = MapMenuItem(text: 'Считать kml файл', icon: Icons.home);
  static const delete = MapMenuItem(text: 'Удалить все точки', icon: Icons.delete);
  static const settings = MapMenuItem(text: 'Настройки', icon: Icons.settings);
  static const logout = MapMenuItem(text: 'Выйти', icon: Icons.logout);
}
