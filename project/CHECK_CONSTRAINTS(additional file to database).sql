Alter table orders ADD CHECK(`Created_Day` < `Required_Day`);
Alter table donations ADD CHECK (`Created_Day` <= `Delivered_Day`);
Alter table human_resource ADD CHECK (`Email` like '%@%.%');
Alter table recipient ADD CHECK (`Email` like '%@%.%');
Alter table donor ADD CHECK (`Email` like '%@%.%');
Alter table donations ADD CHECK (`Expired_Date` - interval 10 day >= `Delivered_Day`);
Alter table recipient ADD CHECK (`Home_Telephone` like '0_________' and !(`Home_Telephone` regexp '[^0-9]'));
Alter table individual ADD CHECK (`Mobile_Phone` like '0_________' and !(`Mobile_Phone` regexp '[^0-9]'));
Alter table recipient ADD CHECK (`Mobile_Phone`  like '0_________' and !(`Mobile_Phone` regexp '[^0-9]'));
Alter table volunteer ADD CHECK (`Mobile_Phone`  like '0_________' and !(`Mobile_Phone` regexp '[^0-9]'));
Alter table collection_centre ADD CHECK (`Operating_Hour_Start` < `Operating_Hours_End`);
Alter table recipient ADD CHECK (`Pcode` like '____' and !(`Pcode` regexp '[^0-9]'));
Alter table branch ADD CHECK (`Pcode` like '____' and !(`Pcode` regexp '[^0-9]'));
Alter table collection_centre ADD CHECK (`Pcode` like '____' and !(`Pcode` regexp '[^0-9]'));
Alter table donor ADD CHECK (`Pcode` like '____' and !(`Pcode` regexp '[^0-9]'));
Alter table human_resource ADD CHECK (`Phone_Number` like '0_________' and !(`Phone_Number` regexp '[^0-9]'));
Alter table collection_centre ADD CHECK (`Phone_Number` like '0_________' and !(`Phone_Number` regexp '[^0-9]'));
Alter table donor ADD CHECK (`Phone_Number` like '0_________' and !(`Phone_Number` regexp '[^0-9]'));
Alter table inventory_remain ADD CHECK (`R_Weight` >= 0);
Alter table orders ADD CHECK (`Transfer_Day` <= `Required_Day` and `Required_Day` > `Created_Day);