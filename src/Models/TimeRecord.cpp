#include "TimeRecord.h"

namespace wp
{

void TimeRecord::setValue(const Seconds value)
{
    m_value = value;
}

QString TimeRecord::getTimeText() const
{
    return durationToString(m_value);
}

TimeRecord::TimeRecord(const Seconds initialValue, QObject* const parent)
    : QObject(parent)
    , m_value(initialValue) {};

TimeRecord::TimeRecord(const TimeRecord& other) noexcept
    : QObject(other.parent())
    , m_value(other.m_value)
{ }

TimeRecord::TimeRecord(TimeRecord&& other) noexcept
    : QObject(other.parent())
    , m_value(std::exchange(other.m_value, Seconds {0}))
{ }

TimeRecord& TimeRecord::operator=(const TimeRecord& other) noexcept
{
    setParent(other.parent());
    m_value = other.m_value;

    return *this;
}

TimeRecord& TimeRecord::operator=(TimeRecord&& other) noexcept
{
    setParent(other.parent());
    m_value = std::exchange(other.m_value, Seconds {0});

    return *this;
}

} // namespace wp
