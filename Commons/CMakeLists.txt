set(SINGLETON_QML Colors.qml Font.qml)

set_source_files_properties(${SINGLETON_QML} PROPERTIES QT_QML_SINGLETON_TYPE
                                                        TRUE)

qt6_add_qml_module(
  Commons
  URI
  Commons
  VERSION
  1.0
  QML_FILES
  ${SINGLETON_QML})
