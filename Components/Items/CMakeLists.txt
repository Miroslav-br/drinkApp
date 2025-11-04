set(QML_SOURCES DrinkCustomItem.qml)

qt6_add_qml_module(
  Items
  URI
  Components.Items
  VERSION
  1.0
  QML_FILES
  ${QML_SOURCES})

target_link_libraries(Items PRIVATE Qt6::Quick Commons)
