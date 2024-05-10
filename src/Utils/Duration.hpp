#pragma once

#include <QString>
#include <chrono>

namespace wp
{

using DurationInt = qint64;

using Days = std::chrono::duration<DurationInt, std::ratio<60 * 60 * 24>>;
using Hours = std::chrono::duration<DurationInt, std::ratio<60 * 60>>;
using Minutes = std::chrono::duration<DurationInt, std::ratio<60>>;
using Seconds = std::chrono::duration<DurationInt>;
using Milliseconds = std::chrono::duration<DurationInt, std::milli>;

template<typename ResultDuration, typename Ratio>
ResultDuration extract(std::chrono::duration<DurationInt, Ratio>& duration)
{
    using InputDuration = std::chrono::duration<DurationInt, Ratio>;

    const ResultDuration result = std::chrono::duration_cast<ResultDuration>(duration);
    duration -= std::chrono::duration_cast<InputDuration>(result);

    return result;
}

template<typename Ratio>
QString durationToString(std::chrono::duration<DurationInt, Ratio> duration)
{
    const auto days = extract<Days>(duration).count();
    const auto hours = extract<Hours>(duration).count();
    const auto minutes = extract<Minutes>(duration).count();
    const auto seconds = extract<Seconds>(duration).count();

    return QString::asprintf("%0*lldd %0*lldh %0*lldm %0*llds", 3, days, 2, hours, 2,
                             minutes, 2, seconds);
}

} // namespace wp
