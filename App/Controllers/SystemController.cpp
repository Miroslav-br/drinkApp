#include "SystemController.h"
#include <QDebug>

SystemController::SystemController(QObject *parent) : QObject{parent} {
  m_drinkPreparingTimer = new QTimer(this);
  m_drinkPreparingTimer->setInterval(3000); // 3s
  m_drinkPreparingTimer->setSingleShot(true);

  connect(m_drinkPreparingTimer, &QTimer::timeout, this,
          &SystemController::drinkPreparingTimerTimeout);
}

SystemController::DrinkTemperature SystemController::drinkTemperature() const {
  return m_drinkTemperature;
}

void SystemController::setDrinkTemperature(
    DrinkTemperature newDrinkTemperature) {
  if (m_drinkTemperature == newDrinkTemperature)
    return;
  m_drinkTemperature = newDrinkTemperature;
  emit drinkTemperatureChanged();
}

Drink *SystemController::selectedDrink() const { return m_selectedDrink; }

void SystemController::setSelectedDrink(Drink *newSelectedDrink) {
  if (m_selectedDrink == newSelectedDrink)
    return;
  m_selectedDrink = newSelectedDrink;
  emit selectedDrinkChanged();
}

void SystemController::setSelectedDrink(int id, const QString &name,
                                        const QString &image,
                                        const QString &galssImage) {
  Drink *drink = new Drink(id, name, image, galssImage, this);
  m_selectedDrink = drink;

  qInfo() << image;
}

void SystemController::startPreparing() {
  qDebug() << "Name: " << m_selectedDrink->name();

  switch (m_drinkTemperature) {
  case HOT:
    qDebug() << "Type: Hot";
    qDebug() << "Sugar Level: " << m_sugarLevel;
    break;
  case COOL:
    qDebug() << "Type: Cool";
    break;
  case FRESHJUICE:
    qDebug() << "Type: Cool freash juice";
    break;
  default:
    break;
  }

  switch (m_drinkSize) {
  case SMALL:
    qDebug() << "Size: Small";
    break;
  case MEDIUM:
    qDebug() << "Size: Medium";
    break;
  case LARGE:
    qDebug() << "Size: Large";
    break;
  default:
    break;
  }

  m_drinkPreparingTimer->start();
}

SystemController::DrinkSize SystemController::drinkSize() const {
  return m_drinkSize;
}

void SystemController::setDrinkSize(const DrinkSize &newDrinkSize) {
  if (m_drinkSize == newDrinkSize)
    return;
  m_drinkSize = newDrinkSize;
  emit drinkSizeChanged();
}

int SystemController::sugarLevel() const { return m_sugarLevel; }

void SystemController::setSugarLevel(int newSugarLevel) {
  if (m_sugarLevel == newSugarLevel)
    return;
  m_sugarLevel = newSugarLevel;
  emit sugarLevelChanged();
}

void SystemController::drinkPreparingTimerTimeout() {
  emit drinkPreparationFinished();
}
