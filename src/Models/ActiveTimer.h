#pragma once

#include <QObject>

#include "Utils/Duration.h"

namespace wp
{

class ActiveTimer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Status status READ getStatus NOTIFY statusChanged)

public:
    enum class Status
    {
        Stopped,
        Running,
        Paused
    };
    Q_ENUM(Status)

    Q_INVOKABLE Status getStatus() const;

    Milliseconds getElapsedTime() const;
    Q_INVOKABLE QString getElapsedTimeText() const;

    Q_INVOKABLE void start();
    Q_INVOKABLE void pause();
    /// @returns elapsed seconds.
    Q_INVOKABLE DurationInt stop();

signals:
    void statusChanged();

public:
    explicit ActiveTimer(QObject* parent = nullptr);
    ~ActiveTimer() override = default;

    ActiveTimer(const ActiveTimer&) = delete;
    ActiveTimer(ActiveTimer&&) = delete;

    ActiveTimer& operator=(ActiveTimer&&) = delete;
    ActiveTimer& operator=(const ActiveTimer&) = delete;

private:
    void setStatus(Status status);

private:
    Milliseconds m_startTime {0};
    Milliseconds m_pauseTime {0};
    Status m_status {Status::Stopped};
};

} // namespace wp
