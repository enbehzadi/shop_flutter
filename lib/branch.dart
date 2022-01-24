class branch{
  late String _shop_name;
  late int _id;
  late String tel;
  late double _lat;
  late double _lng;
  late String _manager;

  branch(this._shop_name, this._id, this.tel, this._lat, this._lng, this._manager);

  String get manager => _manager;

  double get lng => _lng;

  double get lat => _lat;

  int get id => _id;

  String get shop_name => _shop_name;
}