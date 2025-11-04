set(SOURCES HotCoolSelectView.qml CoffeeSelectView.qml
            DrinkSizeSelectionView.qml)

qt6_add_qml_module(
  Views
  URI
  App.Views
  VERSION
  1.0
  QML_FILES
  ${SOURCES})

target_link_libraries(Views PRIVATE Qt6::Quick Commons Items)
