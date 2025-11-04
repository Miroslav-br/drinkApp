#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {

  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;

  engine.load(":/main.qml");

  if (engine.rootObjects().isEmpty()) {
    qInfo() << "QML module has not loaded";
    return -1;
  }

  return app.exec();
}
