#include "serialport.h"

#include <QDebug>

SerialPort::SerialPort(QObject *parent) : QObject(parent) {

    arduino = new QSerialPort(this);
    connect(arduino, &QSerialPort::readyRead, this, &SerialPort::onReadData);
    openDefault();
}

SerialPort::~SerialPort() { delete arduino;}

double SerialPort::get_someVar() const
{
    return m_value;
}

void SerialPort::set_someVar(double newValue)
{
    if(m_value == newValue)
        return;

    m_value = newValue;
    emit someVar_Changed(m_value);
}


void SerialPort::onReadData() {
    if (arduino->bytesAvailable() > 0) {
        QByteArray data = arduino->readAll();
        //        qDebug() << data;
        //        qDebug() << QString(data).trimmed();
        QString value = QString(data).trimmed();
        QStringList listvalue = value.split(" ");
//        qDebug() << listvalue;
        QString lastvalue = listvalue.last();
//        qDebug () << lastvalue;
        bool ok;
        double val = lastvalue.toDouble(&ok);
        qDebug() << val;
        if (ok) {
            if (val >= 55){
                set_someVar((55-val)+200);
            }
            else
                set_someVar(val);
        }
    }
}

void SerialPort::openDefault() {
    arduino->setPortName("COM8");
    arduino->setBaudRate(QSerialPort::Baud115200);
    arduino->setDataBits(QSerialPort::Data8);
    arduino->setParity(QSerialPort::NoParity);
    arduino->setStopBits(QSerialPort::OneStop);

    arduino->open(QSerialPort::ReadWrite);

    if(arduino->isOpen())
    {
        qDebug() << "Serial Port Is Connected";
    }
    else
    {
        qDebug() << "Serial Port Is Not Connected";

    }

}
