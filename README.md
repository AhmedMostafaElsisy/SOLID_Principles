## Liskov Substitution Principle:

The Liskov Substitution principle was introduced by Barbara Liskov in her conference
keynote "Data abstraction" in 1987.Barbara Liskov and Jeannette Wing formulated
the principle succinctly in a 1994 paper as follows:

>Let φ(x) be a property provable about objects x of type T. Then φ(y) should be true for objects y of type S where S is a subtype of T.


The human-readable version repeats pretty much everything that Bertrand Meyer
already has said, but it relies totally on a type-system:


>1. Preconditions cannot be strengthened in a subtype.
>2. Postconditions cannot be weakened in a subtype.
>3. Invariants of the supertype must be preserved in a subtype.

Robert Martin made the definition sound more smoothly and concisely in 1996 :

>Functions that use pointers of references to base classes must be able to use objects of derived classes without knowing it.

Or simply : Subclass/derived class should be substitutable for their base/parent class.

It states that any implementation of an abstraction (interface) should be
substitutable in any place that the abstraction is accepted. Basically,
it takes care that while coding using interfaces in our code,
we not only have a contract of input that the interface receives but also the
output returned by different Classes implementing that interface; they should be
of the same type.

A code snippet to show how violates LSP and how we can fix it :

```dart
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


```

we can fix it as following:

```dart
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


```
