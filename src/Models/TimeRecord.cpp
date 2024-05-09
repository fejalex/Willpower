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
    : CopyableQObject(parent)
    , m_value(initialValue)
{ }

} // namespace wp
