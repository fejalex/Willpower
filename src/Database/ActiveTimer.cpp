#include "ActiveTimer.h"

#include <QDateTime>

namespace wp
{

ActiveTimer::Milliseconds now()
{
    return QDateTime::currentMSecsSinceEpoch();
}

ActiveTimer::Status ActiveTimer::getStatus() const
{
    return m_status;
}

QString ActiveTimer::getElapsedTimeText() const
{
    ActiveTimer::Milliseconds milliseconds;

    if (m_status == Status::Paused)
    {
        auto currentTime = now();
        milliseconds = (currentTime - m_startTime) - (currentTime - m_pauseTime);
    }
    else
    {
        milliseconds = now() - m_startTime;
    }

    // TODO: Replace with actual converting code.
    return QString("0000d 00h 00m 0%1s").arg(milliseconds / 1000);
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
