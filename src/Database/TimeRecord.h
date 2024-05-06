#pragma once

#include <QObject>

namespace wp
{
class TimeRecord : public QObject
{
    Q_OBJECT

public:
    using Seconds = qint64;

    void setValue(Seconds value);

    QString getTimeText() const;

public:
    explicit TimeRecord(Seconds initialValue = 0, QObject* parent = nullptr);
    ~TimeRecord() override = default;

    TimeRecord(const TimeRecord& other) noexcept;
    TimeRecord(TimeRecord&& other) noexcept;

    TimeRecord& operator=(const TimeRecord& other) noexcept;
    TimeRecord& operator=(TimeRecord&& other) noexcept;

private:
    Seconds m_value {0};
};

} // namespace wp
