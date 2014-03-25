part of myriades.event;

class EventLayer {
  CanvasElement _canvas;
  int _tileSize;
  List<EventListener> _listeners = [];

  EventLayer(this._canvas, this._tileSize) {
    _canvas.onClick.listen(this.onClick);
    _canvas.onDoubleClick.listen(this.onDoubleClick);
  }

  void addListener(EventListener listener) {
    _listeners.add(listener);
  }

  void onClick(MouseEvent event) {
    _listeners.forEach((listener) => listener.onClick(getPosition(event)));
  }

  void onDoubleClick(MouseEvent event) {
    _listeners.forEach((listener) => listener.onDoubleClick(getPosition(event)));
  }

  Point getPosition(MouseEvent event) {
    num x = event.client.x / _tileSize;
    num y = event.client.x / _tileSize;
    return new Point(x.floor(), y.floor());
  }
}