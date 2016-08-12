#Barber Shop Site

Simple web site/app for a barber shop with with custom CMS written in Java using [Spring](https://spring.io/), [Hibernate](http://hibernate.org/)  ...  .
This is a [Gradle](https://gradle.org/) project.

##Required software 

**Java** -> JDK version [1.7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)+

**Gradle** -> version [2.1](https://services.gradle.org/distributions/gradle-2.1-bin.zip)

**MySQL** -> local runing mysql server

##DB config

**jdbc defaults**:

- ip -> 127.0.0.1
- port -> 3306
- user -> root
- pass -> root

jdbc params can be changed in __./src/main/resources/jetty-env.xml__

Testet on MySQL Server version 5.1.67

**db init script**

Run the 1.sql(12.08.2015) script located in the db/initDB folder.

##Start/stop jetty embedded server

- **Run** -> gradle jettyRun
- **Stop** -> gradle jettyStop


##Default admin user


##Design

Public part uses custom design.
CMS uses [Pure](http://purecss.io/)