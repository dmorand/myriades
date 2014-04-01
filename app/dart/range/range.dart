library myriades.range;

import 'dart:html';
import '../arena/arena.dart';
import '../tile/tile.dart';

part 'range-layer.dart';

abstract class Range {
  int min;
  int max;

  List<Point> getArea(Point position);
}

bool isValid(Point position) {
  return position.x >= 0 && position.x < ARENA_SIZE && position.y >= 0 && position.y < ARENA_SIZE;
}

void addPosition(Point position, List<Point> area) {
  if(isValid(position)) {
    area.add(position);
  }
}

class Linear extends Range {
  List<Point> getArea(Point position) {
    List<Point> area = [];

    for(int i = this.min; i <= this.max; i++) {
      addPosition(new Point(position.x + i, position.y), area);
      addPosition(new Point(position.x - i, position.y), area);
      addPosition(new Point(position.x, position.y + i), area);
      addPosition(new Point(position.x, position.y - i), area);
    }

    return area;
  }
}

class Diagonal extends Range {
  List<Point> getArea(Point position) {
    List<Point> area = [];

    for(int i = this.min; i <= this.max; i++) {
      addPosition(new Point(position.x + i, position.y + i), area);
      addPosition(new Point(position.x + i, position.y - i), area);
      addPosition(new Point(position.x - i, position.y + i), area);
      addPosition(new Point(position.x - i, position.y - i), area);
    }

    return area;
  }
}

class Radius extends Range {
  List<Point> getArea(Point position) {
    List<Point> area = [];

    return area;
  }
}

class Diamond extends Range {
  List<Point> getArea(Point position) {
    List<Point> area = [];

    return area;
  }
}