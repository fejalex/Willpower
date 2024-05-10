#pragma once

#include <QAbstractListModel>

#include "TimeRecord.h"
#include "ActiveTimer.h"
#include "Utils/DataStorage.hpp"

namespace wp
{

class Database;

class RecordsFolder : public QAbstractListModel
{
    Q_OBJECT

public:
    Q_INVOKABLE QString getName() const;
    TimeRecord* getTimeRecordAt(qint64 index);
    Q_INVOKABLE ActiveTimer* getActiveTimer();
    Q_INVOKABLE void appendTimeRecord(DurationInt seconds);

public:
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public:
    RecordsFolder(DataStorage<Database>* dataStorage,
                  QStringView name = u"",
                  QObject* parent = nullptr);

    ~RecordsFolder() override = default;

    RecordsFolder(const RecordsFolder&) noexcept;
    RecordsFolder(RecordsFolder&&) noexcept;

    RecordsFolder& operator=(const RecordsFolder&) noexcept;
    RecordsFolder& operator=(RecordsFolder&&) noexcept;

public:
    QJsonValue saveToJson() const;
    void loadFromJson(const QJsonValue& json);

private:
    QString m_name;
    ActiveTimer m_activeTimer;
    QList<TimeRecord> m_timeRecords;

    DataStorage<Database>* r_dataStorage;
};

} // namespace wp
