set(QML_SOURCES HotCoolSelectView.qml CoffeeSelectView.qml
                DrinkSizeSelectionView.qml)

qt_add_qml_module(
  Views
  URI
  App.Views
  VERSION
  1.0
  QML_FILES
  ${QML_SOURCES})
