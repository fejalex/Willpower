#pragma once

#include <QObject>

#include "Utils/Duration.hpp"
#include "Utils/CopyableQObject.hpp"

namespace wp
{
class TimeRecord : public CopyableQObject
{
    Q_OBJECT

public:
    void setValue(Seconds value);

    QString getTimeText() const;

public:
    explicit TimeRecord(Seconds initialValue = Seconds(0), QObject* parent = nullptr);
    ~TimeRecord() override = default;

    TimeRecord(const TimeRecord& other) noexcept = default;
    TimeRecord(TimeRecord&& other) noexcept = default;

    TimeRecord& operator=(const TimeRecord& other) noexcept = default;
    TimeRecord& operator=(TimeRecord&& other) noexcept = default;

public:
    QJsonValue saveToJson() const;
    void loadFromJson(const QJsonValue& json);

private:
    Seconds m_value {0};
};

} // namespace wp
