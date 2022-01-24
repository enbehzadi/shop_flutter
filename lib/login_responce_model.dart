class LoginResponceModel{
  int _result;
  String _message;

  LoginResponceModel(this._result, this._message);
  int get result => _result;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  set result(int value) {
    _result = value;
  }


}