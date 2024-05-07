#pragma once

#include <QObject>

namespace wp
{
class TimeRecord : public QObject
{
    Q_OBJECT

public:
    void setValue(std::chrono::seconds value);

    QString getTimeText() const;

public:
    explicit TimeRecord(std::chrono::seconds initialValue = std::chrono::seconds(0),
                        QObject* parent = nullptr);
    ~TimeRecord() override = default;

    TimeRecord(const TimeRecord& other) noexcept;
    TimeRecord(TimeRecord&& other) noexcept;

    TimeRecord& operator=(const TimeRecord& other) noexcept;
    TimeRecord& operator=(TimeRecord&& other) noexcept;

private:
    std::chrono::seconds m_value {0};
};

} // namespace wp
