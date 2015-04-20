Overview
========

Here is an overview of some basic skills that a software engineer may need in his/her daily work.

# Table of Contents
* [Types of Programming](#types-of-programming)
	* [System Programming](#system-programming)
	* [Application Programming](#application-programming)
* [Version Control System](#version-control-system)
	* [Subversion](#subversion)
	* [Git](#git)
		* [SourceTree](#sourcetree)
		* [Github](#github)
		* [Bitbucket](#bitbucket)
* [Programming Language](#programming-language)
* [Database](#database)
	* [SQL](#sql)
		* [Rational Database Management System (RDBMS)](#relational-database-management-system)
			* [MySQL](#mysql)
		* [Object Rational Database Management System (ORDBMS)](#object-relational-database-management-system)
			* [PostgreSQL](#postgresql)
	* [NoSQL](#nosql)
		* [Document Type NoSQL](#document-type-nosql)
			* [MongoDB](#mongodb)
			* [CouchDB](#couchdb)
		* [Key-value Type NoSQL](#key-value-type-nosql)
			* [Redis](#redis)
			* [CouchDB](#couchdb)
* [Development Tools](#development-tools)
	* [Integrated Development Environment (IDE)](#integrated-development-environment)
	* [Editor](#editor)
	* [Command-line Interface (cli)](#command-line-interface)
* [Debugging Tools](#debugging-tools)
* [Thrid Party Libraries](#third-party-libraries)


# Types of Programming
The two major types of programming are [System Programming](#system-programming) and [Application Programming](#application-programming).

## System Programming
[System Programming](http://en.wikipedia.org/wiki/System_programming) focus on producing software that provides services to **computer hardware**.

## Application Programming
Application Programming focus on producing software that provides services to **users**.



# Version Control System
[Version Control System (VCS)](http://en.wikipedia.org/wiki/Revision_control)(<- click on the name to see the wiki page for details) is used to keep track of the codes changes.  There are two major VCS: [Subversion](#subversion) and [Git](#git).

## Subversion
[Subversion (SVN)](http://en.wikipedia.org/wiki/Apache_Subversion) is a centralized [VCS](#version-control-system) contributed by [Apache Foundation](http://en.wikipedia.org/wiki/Apache_Software_Foundation).  You can check the advantages and disadvantages easily online, so this document won't discuss those details in here; SVN has become less and less popular among the developers' community because people find their needs are being better satisfied by [Git](#git).

## Git
[Git](http://en.wikipedia.org/wiki/Git_(software)) is a distributed [VCS](#version-control-system) contributed by [Linus Torvalds](http://en.wikipedia.org/wiki/Linus_Torvalds), who is also the creator of [Linux](http://en.wikipedia.org/wiki/Linux_kernel).  It is currently the most widely used VCS among the community.

### SourceTree
[SourceTree](http://www.sourcetreeapp.com/) is an User Interface (UI) client for [Git](#git).  It enables user to use Git without interacting with the command line interface that came default with Git.

### Github
[Github](https://github.com/) is a remote host of [Git](#git), and it also build a community around Git respositories, which makes code sharing and team collaborations much easier.

### Bitbucket
[Bitbucket](https://bitbucket.org) is similar to [Github](#github), but it allows private repository for free.



# Programming Language
There are many programming languages nowadays; all of them have their pros and cons.  While evaluating a programming language, it is important to understand its intended usage, and therefore, you can choose the language that suit you the most.  I am only going to list some languages here, feel free to go through the complete list in [here](http://en.wikipedia.org/wiki/Comparison_of_programming_languages).



# Database
[Database](http://en.wikipedia.org/wiki/Database) is a collection of data.

## SQL
[SQL](http://en.wikipedia.org/wiki/SQL) stands for Structure Query Language designed for managing data held in a data structure.

### Rational Database Management System
[Rational Database Management System (RDBMS)](http://en.wikipedia.org/wiki/Relational_database_management_system) is a database system based on [relational model](http://en.wikipedia.org/wiki/Relational_model).

#### MySQL
[MySQL](http://en.wikipedia.org/wiki/MySQL) is the most popular open source RDBMS.


### Object Rational Database Management System
[Object Rational Database Management System (ORDBMS)](http://en.wikipedia.org/wiki/Object-relational_database) is similar to [Rational Database Management System (RDBMS)](#rational-database-management-system), but with object-oriented model.

#### PostgreSQL
[PostgreSQL](http://en.wikipedia.org/wiki/PostgreSQL) is the major ORDBMS.



## NoSQL
[NoSQL](http://en.wikipedia.org/wiki/NoSQL) are databases that store and retrieve data using mechanism other than the ways that used by [RDBMS](#relational-database-management-system).

### Document Type NoSQL
[Document Type NoSQL](http://en.wikipedia.org/wiki/NoSQL#Document_store) stores data as a document, usually encode it as XML, YAML, or JSON.

#### MongoDB
[MongoDB](http://en.wikipedia.org/wiki/MongoDB) is one of the popular [Document Type NoSQL](#document-type-nosql); it stores data as JSON and binary JSON a.k.a BSON.

#### CouchDB
[CouchDB](http://en.wikipedia.org/wiki/CouchDB) is similar to [MongoDB](#mongodb), but it focuses on ease of use.  Another major feature of CouchDB is that it uses [Multi-Version Concurrency Control (MVCC)](http://en.wikipedia.org/wiki/Multiversion_concurrency_control) instead of locking database during concurrent writes.


### Key-value Type NoSQL
[Key-value Type NoSQL](http://en.wikipedia.org/wiki/NoSQL#Key-value_stores) use Map/Dictionary to store data.

#### Redis
[Redis](http://en.wikipedia.org/wiki/Redis) stands for REmote DIctionary Server.  It is open source and one of the most popular KV-RAM NoSQL.

#### CouchDB
[CouchDB](http://en.wikipedia.org/wiki/CouchDB) is a document-oriented NoSQL database that uses JSON to store data, JavaScript as its query language using MapReduce, and HTTP for an API.



# Development Tools

## Integrated Development Environment
[Integrated Development Environment (IDE)](http://en.wikipedia.org/wiki/Integrated_development_environment) is a tool that aims at maximizing the productivity of software engineers.

 