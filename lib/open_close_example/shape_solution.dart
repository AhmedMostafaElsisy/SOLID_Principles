import 'dart:developer';

abstract class Shape {
  void draw();
}

class Rectangle extends Shape {
  double width;
  double length;

  Rectangle({
    required this.width,
    required this.length,
  });

  @override
  void draw() {
    log("draw rectangle");
  }
}

class Circle extends Shape {
  double radius;

  Circle({
    required this.radius,
  });

  @override
  void draw() {
    log("draw circle");
  }
}

// * now can add classes extends from Shape

class ShapeDrawer {
  //this is close to change
  void drawShape(Shape shape) {
    shape.draw();
  }
}
