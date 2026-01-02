#pragma once
#include <QObject>
#include <QTimer>
#include <QtQmlIntegration>

#include <App/Models/Drink.h>

class SystemController : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON

  Q_PROPERTY(DrinkTemperature drinkTemperature READ drinkTemperature WRITE
                 setDrinkTemperature NOTIFY drinkTemperatureChanged FINAL)
  Q_PROPERTY(DrinkSize drinkSize READ drinkSize WRITE setDrinkSize NOTIFY
                 drinkSizeChanged FINAL)
  Q_PROPERTY(int sugarLevel READ sugarLevel WRITE setSugarLevel NOTIFY
                 sugarLevelChanged FINAL)
  Q_PROPERTY(Drink *selectedDrink READ selectedDrink WRITE setSelectedDrink
                 NOTIFY selectedDrinkChanged FINAL)

public:
  enum DrinkTemperature { NONE, HOT, COOL, FRESHJUICE };
  Q_ENUM(DrinkTemperature);

  enum DrinkSize { NOSIZE, SMALL, MEDIUM, LARGE };
  Q_ENUM(DrinkSize);

  explicit SystemController(QObject *parent = nullptr);

  DrinkTemperature drinkTemperature() const;
  void setDrinkTemperature(DrinkTemperature newDrinkTemperature);

  Drink *selectedDrink() const;
  void setSelectedDrink(Drink *newSelectedDrink);

  DrinkSize drinkSize() const;
  void setDrinkSize(const DrinkSize &newDrinkSize);

  int sugarLevel() const;
  void setSugarLevel(int newSugarLevel);

public slots:
  void drinkPreparingTimerTimeout();
  void setSelectedDrink(int id, const QString &name, const QString &image,
                        const QString &glassImage);
  void startPreparing();

signals:
  void drinkTemperatureChanged();
  void selectedDrinkChanged();

  void drinkSizeChanged();

  void sugarLevelChanged();

  void drinkPreparationFinished();

private:
  DrinkTemperature m_drinkTemperature;
  Drink *m_selectedDrink = nullptr;
  DrinkSize m_drinkSize;
  int m_sugarLevel;

  QTimer *m_drinkPreparingTimer;
};
