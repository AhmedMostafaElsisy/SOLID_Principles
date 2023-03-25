abstract class Shape {
  double calcArea();
}

class Rectangle implements Shape {
  double _height;
  double _width;


  Rectangle(this._height, this._width);

  set width(double width) {
    _width = width;
  }

   set height(double height) {
    _height = height;
  }

  @override
  double calcArea() {
    return _width * _height;
  }
}

class Square implements Shape {
  double _side;

  set side(double side) => _side = side;



  Square(this._side);

  @override
  double calcArea() {
    return _side * _side;
  }
}
