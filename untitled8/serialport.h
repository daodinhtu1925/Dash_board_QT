#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QSerialPort>
#include <QDebug>

class SerialPort : public QObject {
    Q_OBJECT
    Q_PROPERTY(double someVar READ get_someVar WRITE
               set_someVar NOTIFY someVar_Changed)
    public:
        SerialPort(QObject *parent = nullptr);
        ~SerialPort();

        double get_someVar() const;
        void set_someVar(double newValue);

    public slots:
        void onReadData();

    signals:
        void someVar_Changed(double newValue);

    private:
        QSerialPort *arduino;
        double m_value;

        void openDefault();
};

#endif // SERIALPORT_H
