class Memory{
  String _value = '0';

  void applyCommand(String command) {
    if(command == 'AC') {
      _allClear();
    } else {
      _value += command; //altera o valor
    }
  }

  _allClear() { //apaga tudo
    _value = '0';
  }

  String get value {
    return _value;
  }
}