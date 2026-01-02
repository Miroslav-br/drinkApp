#pragma once

#include <QObject>
#include <QUrl>
#include <qtmetamacros.h>

class Drink : public QObject {
  Q_OBJECT
  Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
  Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
  Q_PROPERTY(QUrl image READ image WRITE setImage NOTIFY imageChanged)
  Q_PROPERTY(QUrl glassImage READ glassImage WRITE setGlassImage NOTIFY
                 glassImageChanged)
public:
  Drink(int id, const QString &name, const QUrl &image, const QUrl &glassImage, QObject *parent = nullptr);

  QUrl image() const;
  void setImage(const QUrl &newImage);

  QString name() const;
  void setName(const QString &newName);

  QUrl glassImage() const;
  void setGlassImage(const QUrl &newGlassImage);

  int id() const;
  void setId(int newId);

signals:
  void imageChanged();
  void nameChanged();
  void glassImageChanged();
  void idChanged();

private:
  int m_id = 0;
  QString m_name = "";
  QUrl m_image = QUrl();
  QUrl m_glassImage = QUrl();
};
