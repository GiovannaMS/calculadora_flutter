class Memory {
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false;
  String? _lastCommand;

  void applyCommand(String command) {
    //substitui a operação pela última se clicar em duas ou mais
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      //se algum comando dos que estão listados no operations for passado
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  //verifica se o command e o _lastCommand são diferentes de = e se pertencem a 
  //operations para poder substituir a operação
  _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  //atribui valor no segundo buffer após selecionar uma operação
  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      //resultado da operação é armazenado no índice 0
      _buffer[0] = _calculate();
      _buffer[1] = 0.0; //zera o índice 1
      _value = _buffer[0].toString(); //mostra o resultado no display
      //se for um num inteiro ele tira o ".0" do final no display
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1; //se for '=' _bufferIndex fica '0'
    }
    _wipeValue = true;
  }

  //limpa o display quando for informar outro valor
  _addDigit(String digit) {
    final isDot = digit == '.';
    //apaga o zero inicial do display a menos q o valor passado seja um ponto
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    //não permite utilizar dois pontos no mesmo valor
    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    //se selecionar o ponto após uma operação ele assume o valor de 0.
    final emptyValue = isDot ? '0' : '';
    //se _wipeValue for true ele limpa o display
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    //converte o valor recebido de string para double
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  //apaga tudo
  _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }
}
