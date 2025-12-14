set(QML_SOURCES DrinkCustomItem.qml BackButton.qml BottomTimer.qml)

qt6_add_qml_module(
  Components
  URI
  Components
  VERSION
  1.0
  QML_FILES
  ${QML_SOURCES})
