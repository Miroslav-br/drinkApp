#include "DrinkListModel.h"
#include <qalgorithms.h>
#include <qlogging.h>

DrinkListModel::DrinkListModel(const QString &jsonKey, QObject *parent)
    : QAbstractListModel(parent), m_jsonKey(jsonKey) {};

int DrinkListModel::rowCount(const QModelIndex &parent) const {
  return parent.isValid() ? 0 : m_drinkList.length();
}

QVariant DrinkListModel::data(const QModelIndex &index, int role) const {
  if (index.isValid() || index.row() < 0 ||
      index.row() >= m_drinkList.length()) {
    return QVariant();
  }

  Drink *drink = m_drinkList[index.row()];

  switch ((Role)role) {
  case Role::IdRole:
    return drink->id();
  case Role::NameRole:
    return drink->name();
  case Role::ImageRole:
    return drink->image();
  case Role::GlassImageRole:
    return drink->glassImage();
    break;
  }

  return QVariant();
}

QHash<int, QByteArray> DrinkListModel::roleNames() const {

  QHash<int, QByteArray> hash;

  hash[static_cast<int>(Role::IdRole)] = "id";
  hash[static_cast<int>(Role::NameRole)] = "name";
  hash[static_cast<int>(Role::ImageRole)] = "image";
  hash[static_cast<int>(Role::GlassImageRole)] = "glassImage";

  return hash;
};

void DrinkListModel::loadFromJson(const QString &filePath) {
  QFile file(filePath);
  if (!file.open(QIODeviceBase::ReadOnly)) {
    qWarning() << "File not open" << filePath;
  }

  QJsonDocument doc = QJsonDocument::fromJson(file.readAll());
  file.close();

  beginResetModel();
  qDeleteAll(m_drinkList);
  m_drinkList.clear();

  QJsonObject json = doc.object();
  QJsonArray drinkArray = json[m_jsonKey].toArray();
  for (const QJsonValue &value : drinkArray) {
    QJsonObject jsonObject = value.toObject();
    m_drinkList.append(new Drink(jsonObject["id"].toInt(),
                                 jsonObject["name"].toString(),
                                 jsonObject["image"].toString(),
                                 jsonObject["glassImage"].toString(), this));
  }

  endResetModel();
}
