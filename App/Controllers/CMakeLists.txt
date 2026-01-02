set(CXX_SOURCES SystemController.cpp)
set(H_SOURCES SystemController.h)
set(LIBRARY_NAME Controllers)

add_library(${LIBRARY_NAME} SHARED)

qt_add_qml_module(${LIBRARY_NAME} URI App.${LIBRARY_NAME} SOURCES
                  ${CXX_SOURCES} ${H_SOURCES})

target_link_libraries(${LIBRARY_NAME} PUBLIC Qt6::Core Models)
