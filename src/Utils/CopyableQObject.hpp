#pragma once

#include <QObject>

namespace wp
{

class CopyableQObject : public QObject
{
    Q_OBJECT

public:
    CopyableQObject(QObject* parent = nullptr)
        : QObject(parent)
    { }

    ~CopyableQObject() = default;

    CopyableQObject(const CopyableQObject& other)
        : QObject(other.parent())
    { }

    CopyableQObject(CopyableQObject&& other)
        : QObject(other.parent())
    { }

    CopyableQObject& operator=(const CopyableQObject& other)
    {
        if (this == &other)
        {
            return *this;
        }

        setParent(other.parent());
        return *this;
    }

    CopyableQObject& operator=(CopyableQObject&& other)
    {
        setParent(other.parent());
        return *this;
    }
};

} // namespace wp
