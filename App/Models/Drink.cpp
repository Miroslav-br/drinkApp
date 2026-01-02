#include "Drink.h"

QUrl Drink::image() const { return m_image; }

void Drink::setImage(const QUrl &newImage) {
  if (m_image == newImage)
    return;
  m_image = newImage;
  emit imageChanged();
}

QString Drink::name() const { return m_name; }

void Drink::setName(const QString &newName) {
  if (m_name == newName)
    return;
  m_name = newName;
  emit nameChanged();
}

QUrl Drink::glassImage() const { return m_glassImage; }

void Drink::setGlassImage(const QUrl &newGlassImage) {
  if (m_glassImage == newGlassImage)
    return;
  m_glassImage = newGlassImage;
  emit glassImageChanged();
}

int Drink::id() const { return m_id; }

void Drink::setId(int newId) {
  if (m_id == newId)
    return;
  m_id = newId;
  emit idChanged();
}

Drink::Drink(int id, const QString &name, const QUrl &image, const QUrl &glassImage, QObject *parent) : QObject(parent),
    m_id(id),
    m_name(name),
    m_image(image),
    m_glassImage(glassImage)
{}
