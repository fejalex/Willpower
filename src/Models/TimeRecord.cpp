#include "TimeRecord.h"

#include <QJsonValue>

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

QJsonValue TimeRecord::saveToJson() const
{
    return QJsonValue(m_value.count());
}

void TimeRecord::loadFromJson(const QJsonValue& json)
{
    m_value = Seconds(json.toInteger(0));
}

} // namespace wp
