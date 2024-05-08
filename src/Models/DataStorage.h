#pragma once

#include <QString>
#include <QDir>
#include <QJsonDocument>
#include <QJsonObject>

namespace wp
{

template<class T>
class DataStorage
{
public:
    void setDataPointer(T* data);

    void saveData() const;
    bool tryLoadData() const;

public:
    explicit DataStorage(const QStringView filePath)
        : m_filePath(filePath.data())
    { }

    ~DataStorage() = default;

    DataStorage(const DataStorage& other) = delete;
    DataStorage(DataStorage&& other) = delete;

    DataStorage& operator=(const DataStorage& other) = delete;
    DataStorage& operator=(DataStorage&& other) = delete;

private:
    T* r_data {nullptr};
    QString m_filePath;
};

template<class T>
void DataStorage<T>::setDataPointer(T* data)
{
    r_data = data;
}

template<class T>
void DataStorage<T>::saveData() const
{
    if (r_data == nullptr)
    {
        return;
    }

    QDir::root().mkpath(QFileInfo(m_filePath).absolutePath());

    QFile file(m_filePath);

    if (!file.open(QIODeviceBase::WriteOnly | QIODeviceBase::Text))
    {
        qDebug() << QString("Could not open file \"%1\" for writing.").arg(m_filePath);
        return;
    }

    // TODO: Save with QJsonDocument::JsonFormat::Compact in release version.
    file.write(QJsonDocument {r_data->saveToJson()}.toJson());
    file.close();
}

template<class T>
bool DataStorage<T>::tryLoadData() const
{
    if (r_data == nullptr)
    {
        return false;
    }

    QFile file(m_filePath);

    if (!file.open(QIODeviceBase::ReadOnly | QIODeviceBase::Text))
    {
        return false;
    }

    r_data->loadFromJson(QJsonDocument::fromJson(file.readAll()).object());
    file.close();

    return true;
}

} // namespace wp
