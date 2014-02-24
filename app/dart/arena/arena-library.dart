library myriades.arena;

import 'dart:html';
import '../tile/tileset.dart';

part 'arena.dart';

class ArenaLibrary {
  Map<String, Arena> _arenas = {};
  TileSet _tileSet;
  Function _onLoad;

  ArenaLibrary.load(String filename, TileSet tileSet, [Function onLoad]) {
    _tileSet = tileSet;
    _onLoad = onLoad;
    HttpRequest.getString(filename).then(_parseArenas);
  }

  Iterable<String> getArenaIds() {
    return _arenas.keys;
  }

  Arena getArena(String id) {
    assert(_arenas.containsKey(id));
    return _arenas[id];
  }

  _parseArenas(String text) {
    List<String> lines = text.split('\n');

    while(!lines.isEmpty) {
      String id = lines.removeAt(0);
      List<String> arenaText = [];
      arenaText.addAll(lines.getRange(0, 8));
      _arenas[id] = new Arena.fromText(id, arenaText, _tileSet);
      lines.removeRange(0, 9);
    }

    if(_onLoad != null) {
      _onLoad();
      _onLoad = null;
    }
  }
}