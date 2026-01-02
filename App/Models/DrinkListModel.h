#include "Drink.h"
#include <QAbstractListModel>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QtQmlIntegration>
#include <qtmetamacros.h>

class DrinkListModel : public QAbstractListModel {
  Q_OBJECT
  Q_PROPERTY(QString jsonKey MEMBER m_jsonKey NOTIFY jsonKeyChanged)
  QML_ELEMENT
public:
  enum class Role : int {
    IdRole = Qt::UserRole + 1,
    NameRole,
    ImageRole,
    GlassImageRole
  };
  Q_ENUM(Role)

  DrinkListModel(const QString &jsonKey = "", QObject *parent = nullptr);

  virtual int rowCount(const QModelIndex &parent) const override;
  virtual QVariant data(const QModelIndex &index, int role) const override;
  virtual QHash<int, QByteArray> roleNames() const override;

  QString m_jsonKey;
public slots:
  void loadFromJson();

signals:
  void jsonKeyChanged();

private:
  QList<Drink *> m_drinkList;
};
