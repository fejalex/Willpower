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

    qDebug() << "Saving...";

    QDir::root().mkpath(QFileInfo(m_filePath).absolutePath());

    QFile file(m_filePath);

    if (!file.open(QIODeviceBase::WriteOnly | QIODeviceBase::Text))
    {
        qWarning()
            << QString("Could not open file \"%1\" for data saving.").arg(m_filePath);
        return;
    }

    file.write(QJsonDocument(r_data->saveToJson().toObject())
                   .toJson(QJsonDocument::JsonFormat::Compact));
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
        qWarning()
            << QString("Could not open file \"%1\" for data loading.").arg(m_filePath);
        return false;
    }

    r_data->loadFromJson(QJsonDocument::fromJson(file.readAll()).object());
    return true;
}

} // namespace wp
