# 请在以下空白处填写完成任务的语句，空白行可通过回车换行添加。
# 你也可以在命令行窗口完成任务，不过，在命令行键入的语句不会被保存。
drop database if exists MyDb;
CREATE DATABASE MyDb;
use MyDb;
CREATE TABLE hr(
    id char(10) PRIMARY KEY,
    name varchar(32) NOT NULL,
    mz char(16) default("汉族")
);



# 结束 