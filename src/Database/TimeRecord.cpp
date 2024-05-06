#include "TimeRecord.h"

namespace wp
{

void TimeRecord::setValue(const Seconds value)
{
    m_value = value;
}

QString TimeRecord::getTimeText() const
{
    // TODO: Replace with actual converting code.
    return QString("0000d 00h 00m 0%1s").arg(m_value);
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
    , m_value(std::exchange(other.m_value, 0))
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
    m_value = std::exchange(other.m_value, 0);

    return *this;
}

} // namespace wp
