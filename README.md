## Open-closed Principle :

>Entities should be open for extension, but closed for modification.

Software entities (classes, modules, functions, etc.) be extendable without actually changing the contents of the class you're extending. If we could follow this principle strongly enough, it is possible to then modify the behavior of our code without ever touching a piece of original code.

Please look at the following code :

```dart
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

```

If we want to draw the shape for Circle we have to modify drawShape method in
ShapeDrawer class. It breaks the open-closed principle. According to this principle,
we can not modify we can extend. So How we can fix this problem, please see the following code :


```dart
class Rectangle {
  double width;
  double length;

  Rectangle({
    required this.width,
    required this.length,
  });

  void drawRectangle() {}
}

class Square {
  double side;

  Square({
    required this.side,
  });

  void drawSquare() {}
}

class ShapeDrawer {
  void drawShape(Object shape) {
    if (shape is Rectangle) {
      shape.drawRectangle();
    } else if (shape is Square) {
      shape.drawSquare();
    }
  }
}
```

Now we can add shapes without modifying ShapeDrawer class.

