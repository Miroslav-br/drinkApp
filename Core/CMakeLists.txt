set(SINGLETON_QML Colors.qml Fonts.qml Resources.qml)

set_source_files_properties(${SINGLETON_QML} PROPERTIES QT_QML_SINGLETON_TYPE
                                                        TRUE)

qt6_add_qml_module(
  Core
  URI
  Core
  VERSION
  1.0
  QML_FILES
  ${SINGLETON_QML})
