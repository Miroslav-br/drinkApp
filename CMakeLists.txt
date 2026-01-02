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

qt_standard_project_setup(REQUIRES 6.8)

add_subdirectory(App)
add_subdirectory(Core)
add_subdirectory(Components)

qt_add_executable(${PROJECT_NAME} main.qrc main.cpp)

qt_add_qml_module(${PROJECT_NAME} URI ${PROJECT_NAME}_QML QML_FILES main.qml)

target_link_libraries(
  ${PROJECT_NAME}
  PRIVATE Qt6::Qml
          Qt6::Core
          Qt6::Widgets
          Qt6::Gui
          Views
          Core
          Components)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
