#pragma once

#include <QAbstractListModel>

#include "TimeRecord.h"
#include "ActiveTimer.h"

namespace wp
{
class RecordsFolder : public QAbstractListModel
{
    Q_OBJECT

public:
    QString getName() const;
    TimeRecord* getTimeRecordAt(qint64 index);
    Q_INVOKABLE ActiveTimer* getActiveTimer();

public:
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public:
    explicit RecordsFolder(QObject* parent = nullptr);
    RecordsFolder(QStringView name, QObject* parent = nullptr);

    ~RecordsFolder() override = default;

    RecordsFolder(const RecordsFolder&) noexcept;
    RecordsFolder(RecordsFolder&&) noexcept;

    RecordsFolder& operator=(const RecordsFolder&) noexcept;
    RecordsFolder& operator=(RecordsFolder&&) noexcept;

private:
    QString m_name;
    QList<TimeRecord> m_timeRecords;
    ActiveTimer m_activeTimer;
};
} // namespace wp
