set(CXX_SOURCES Drink.cpp DrinkListModel.cpp)
set(H_SOURCES Drink.h DrinkListModel.h)
set(LIBRARY_NAME Models)

add_library(${LIBRARY_NAME} SHARED)

qt_add_qml_module(${LIBRARY_NAME} URI App.${LIBRARY_NAME} SOURCES
                  ${CXX_SOURCES} ${H_SOURCES})

target_link_libraries(${LIBRARY_NAME} PUBLIC Qt6::Core)
target_include_directories(Models PUBLIC ${CMAKE_SOURCE_DIR})
