#include "ActiveTimer.h"

#include <QDateTime>

#include "Duration.h"

namespace wp
{

static std::chrono::milliseconds now()
{
    return std::chrono::milliseconds {QDateTime::currentMSecsSinceEpoch()};
}

ActiveTimer::Status ActiveTimer::getStatus() const
{
    return m_status;
}

QString ActiveTimer::getElapsedTimeText() const
{
    std::chrono::milliseconds milliseconds;

    if (m_status == Status::Paused)
    {
        milliseconds = m_pauseTime - m_startTime;
    }
    else
    {
        milliseconds = now() - m_startTime;
    }

    return durationToString(milliseconds);
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

void ActiveTimer::stop()
{
    setStatus(Status::Stopped);
}

ActiveTimer::ActiveTimer(QObject* const parent)
    : QObject(parent)
{ }

void ActiveTimer::setStatus(const Status status)
{
    m_status = status;
    emit statusChanged();
}

} // namespace wp
