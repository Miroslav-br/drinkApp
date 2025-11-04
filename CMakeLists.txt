cmake_minimum_required(VERSION 3.22)

project(DrinkApp CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED OM)
set(CMAKE_AUTORCC ON)
set(QT_QML_GENERATE_QMLLS_INI ON)

find_package(
  Qt6
  COMPONENTS
  REQUIRED Core Quick Widgets Gui)

qt6_standard_project_setup(REQUIRES 6.8)
add_subdirectory(App)
add_subdirectory(Commons)
add_subdirectory(Components)

qt6_add_executable(${PROJECT_NAME} main.qrc main.cpp)

qt6_add_qml_module(${PROJECT_NAME} URI ${PROJECT_NAME}_QML QML_FILES main.qml)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Qml Qt6::Core Qt6::Widgets
                                              Commons Qt6::Gui Views)
