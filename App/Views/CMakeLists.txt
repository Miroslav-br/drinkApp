set(QML_SOURCES
    HotCoolSelectView.qml
    DrinkSelectView.qml
    DrinkSizeSelectionView.qml
    SugarSizeSelectionView.qml
    ConfirmationScreen.qml
    LoadingIndicatorView.qml
    FinishedView.qml)

qt_add_qml_module(
  Views
  URI
  App.Views
  VERSION
  1.0
  QML_FILES
  ${QML_SOURCES})
