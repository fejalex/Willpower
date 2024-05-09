#include "ActiveTimer.h"

#include <QDateTime>

#include "AppData/Database.h"

namespace wp
{

static Milliseconds now()
{
    return Milliseconds {QDateTime::currentMSecsSinceEpoch()};
}

ActiveTimer::Status ActiveTimer::getStatus() const
{
    return m_status;
}

Milliseconds ActiveTimer::getElapsedTime() const
{
    if (m_status == Status::Paused)
    {
        return m_pauseTime - m_startTime;
    }
    else
    {
        return now() - m_startTime;
    }
}

QString ActiveTimer::getElapsedTimeText() const
{
    return durationToString(getElapsedTime());
}

void ActiveTimer::start()
{
    if (m_status == Status::Paused)
    {
        m_startTime += (now() - m_pauseTime);
    }
    else
    {
        m_startTime = now();
    }

    setStatus(Status::Running);
}

void ActiveTimer::pause()
{
    m_pauseTime = now();
    setStatus(Status::Paused);
}

DurationInt ActiveTimer::stop()
{
    const auto elapsedTime
        = std::chrono::duration_cast<Seconds>(getElapsedTime()).count();

    setStatus(Status::Stopped);

    return elapsedTime;
}

ActiveTimer::ActiveTimer(DataStorage<Database>* const dataStorage, QObject* const parent)
    : CopyableQObject(parent)
    , r_dataStorage(dataStorage)
{ }

QJsonValue ActiveTimer::saveToJson() const
{
    QJsonObject result;

    result.insert("startTime", m_startTime.count());
    result.insert("pauseTime", m_pauseTime.count());
    result.insert("status", static_cast<int>(m_status));

    return result;
}

void ActiveTimer::loadFromJson(const QJsonValue& json)
{
    const auto object = json.toObject();

    m_startTime = Milliseconds(object.value("startTime").toInteger(0));
    m_pauseTime = Milliseconds(object.value("pauseTime").toInteger(0));
    m_status = Status(object.value("status").toInt(0));
}

void ActiveTimer::setStatus(const Status status)
{
    m_status = status;
    emit statusChanged();
    r_dataStorage->saveData();
}

} // namespace wp
