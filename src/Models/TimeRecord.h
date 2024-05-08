#pragma once

#include <QObject>

#include "Utils/Duration.h"

namespace wp
{
class TimeRecord : public QObject
{
    Q_OBJECT

public:
    void setValue(Seconds value);

    QString getTimeText() const;

public:
    explicit TimeRecord(Seconds initialValue = Seconds(0), QObject* parent = nullptr);
    ~TimeRecord() override = default;

    TimeRecord(const TimeRecord& other) noexcept;
    TimeRecord(TimeRecord&& other) noexcept;

    TimeRecord& operator=(const TimeRecord& other) noexcept;
    TimeRecord& operator=(TimeRecord&& other) noexcept;

private:
    Seconds m_value {0};
};

} // namespace wp
