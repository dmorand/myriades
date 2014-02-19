library myriades.arena;

import 'dart:html';
import '../tile/tileset.dart';

part 'arena.dart';

class ArenaLibrary {
  Map<String, Arena> _arenas;

  Iterable<String> arenaIds() {
    return _arenas.keys;
  }
}