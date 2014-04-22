library myriades.range;

import 'dart:collection';
import 'dart:html';
import '../arena/arena.dart';
import '../tile/tile.dart';

part 'range-layer.dart';

Range parseRange(Map jsonRange) {
  String type = jsonRange['type'];
  int min = jsonRange['min'];
  int max = jsonRange['max'];

  switch(type) {
    case 'linear': return new LinearRange(min, max);
    case 'diagonal': return new DiagonalRange(min, max);
    case 'radius': return new RadiusRange(min, max);
    case 'diamond': return new DiamondRange(min, max);
  }

  throw 'Unsupported range type: "$type"';
}

abstract class Range {
  int min;
  int max;

  Range(this.min, this.max);

  Set<Point> getArea(Point position);
}

class LinearRange extends Range {
  LinearRange(int min, int max) : super(min, max);

  Set<Point> getArea(Point position) {
    Set<Point> area = new HashSet<Point>();

    for(int i = this.min; i <= this.max; i++) {
      _addPosition(new Point(position.x + i, position.y), area);
      _addPosition(new Point(position.x - i, position.y), area);
      _addPosition(new Point(position.x, position.y + i), area);
      _addPosition(new Point(position.x, position.y - i), area);
    }

    return area;
  }
}

class DiagonalRange extends Range {
  DiagonalRange(int min, int max) : super(min, max);

  Set<Point> getArea(Point position) {
    Set<Point> area = new HashSet<Point>();

    for(int i = this.min; i <= this.max; i++) {
      _addPosition(new Point(position.x + i, position.y + i), area);
      _addPosition(new Point(position.x + i, position.y - i), area);
      _addPosition(new Point(position.x - i, position.y + i), area);
      _addPosition(new Point(position.x - i, position.y - i), area);
    }

    return area;
  }
}

class RadiusRange extends Range {
  RadiusRange(int min, int max) : super(min, max);

  Set<Point> getArea(Point position) {
    Set<Point> area = new HashSet<Point>();

    for(int i = this.min; i <= this.max; i++) {
      for(int delta = -i; delta <= i; delta++) {
        _addPosition(new Point(position.x + i, position.y + delta), area);
        _addPosition(new Point(position.x - i, position.y + delta), area);
        _addPosition(new Point(position.x + delta, position.y + i), area);
        _addPosition(new Point(position.x + delta, position.y - i), area);
      }
    }

    return area;
  }
}

class DiamondRange extends Range {
  DiamondRange(int min, int max) : super(min, max);

  Set<Point> getArea(Point position) {
    Set<Point> area = new HashSet<Point>();

    for(int x = -this.max; x <= this.max; x++) {
      for(int y = -this.max; y <= this.max; y++) {
        num sum = x.abs() + y.abs();
        if(sum >= this.min && sum <= this.max) {
          _addPosition(new Point(position.x + x, position.y + y), area);
        }
      }
    }

    return area;
  }
}

bool _isValid(Point position) {
  return position.x >= 0 && position.x < ARENA_SIZE && position.y >= 0 && position.y < ARENA_SIZE;
}

void _addPosition(Point position, Set<Point> area) {
  if(_isValid(position)) {
    area.add(position);
  }
}