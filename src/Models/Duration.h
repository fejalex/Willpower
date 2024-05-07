#pragma once

#include <QString>
#include <chrono>

namespace std::chrono
{

using days = std::chrono::duration<int64_t, std::ratio<60 * 60 * 24>>;

} // namespace std::chrono

namespace wp
{

template<typename ResultDuration, typename Ratio>
ResultDuration extract(std::chrono::duration<int64_t, Ratio>& duration)
{
    using InputDuration = std::chrono::duration<int64_t, Ratio>;

    const ResultDuration result = std::chrono::duration_cast<ResultDuration>(duration);
    duration -= std::chrono::duration_cast<InputDuration>(result);

    return result;
}

template<typename Ratio>
QString durationToString(std::chrono::duration<int64_t, Ratio> duration)
{
    const auto days = extract<std::chrono::days>(duration).count();
    const auto hours = extract<std::chrono::hours>(duration).count();
    const auto minutes = extract<std::chrono::minutes>(duration).count();
    const auto seconds = extract<std::chrono::seconds>(duration).count();

    return QString::asprintf("%0*ldd %0*ldh %0*ldm %0*lds", 3, days, 2, hours, 2, minutes,
                             2, seconds);
}

} // namespace wp
