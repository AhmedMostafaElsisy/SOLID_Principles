class Rectangle {
  double? _height;
  double? _width;

  Rectangle([
    this._width,
    this._height,
  ]);

  set width(double width) {
    _width = width;
  }

  set height(double height) {
    _height = height;
  }

  double calcArea() {
    return _width! * _height!;
  }
}

class Square extends Rectangle {
  @override
  set width(double width) {
    super.width = width;
    super.height = width;
  }

  @override
  set height(double height) {
    super.width = height;
    super.height = height;
  }
}
