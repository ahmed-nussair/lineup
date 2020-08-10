class DrawerItem {
  String _iconPath;
  String _title;
  Function _function;

  DrawerItem(this._iconPath, this._title, this._function);

  Function get function => _function;

  String get title => _title;

  String get iconPath => _iconPath;
}