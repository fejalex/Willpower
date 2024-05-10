#pragma once

#include <QObject>

#include "Utils/Duration.hpp"
#include "Utils/DataStorage.hpp"
#include "Utils/CopyableQObject.hpp"

namespace wp
{

class Database;

class ActiveTimer : public CopyableQObject
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
    explicit ActiveTimer(DataStorage<Database>* dataStorage, QObject* parent = nullptr);
    ~ActiveTimer() override = default;

    ActiveTimer(const ActiveTimer&) = default;
    ActiveTimer(ActiveTimer&&) = default;

    ActiveTimer& operator=(const ActiveTimer&) = default;
    ActiveTimer& operator=(ActiveTimer&&) = default;

public:
    QJsonValue saveToJson() const;
    void loadFromJson(const QJsonValue& json);

private:
    void setStatus(Status status);

private:
    Milliseconds m_startTime {0};
    Milliseconds m_pauseTime {0};
    Status m_status {Status::Stopped};

    DataStorage<Database>* r_dataStorage;
};

} // namespace wp
