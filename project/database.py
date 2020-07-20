import pymysql

class Database:
    def connect(self):
        return pymysql.connect(host='localhost',
                             user='Cecilia',
                             password='P43a43p43a43',
                             db='ceciliachengdb')

    def read_donor(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `donor`")
            else:
                cursor.execute("SELECT * FROM `donor` where Donor_Id=%s", id,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_recipient(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `recipient`")
            else:
                cursor.execute("SELECT * FROM `recipient` where R_Id=%s", (id,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def read_recipient_3(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `recipient`")
            else:
                cursor.execute("SELECT * FROM `recipient` where Centre_Id=%s", (id,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_employee(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM employee_join")
            else:
                cursor.execute("SELECT * FROM employee_join", (id,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_volunteer(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM volunteer_join")
            else:
                cursor.execute("SELECT * FROM volunteer_join", (id,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_human_resources(self, email):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM human_resource")
            else:
                cursor.execute("select id from human_resource where Email=%s",email,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_not_id(self):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("SELECT * FROM `human_resource` WHERE id not in(select id from employee) and id not in (select id from volunteer)")

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def insert_human_resources(self,data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("INSERT INTO `human_resource` (`Name`, `Email`, `Phone_Number`) VALUES(%s, %s, %s)",
                           (data[ 'name' ], data[ 'email' ], data[ 'phone' ],))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def insert_human_resources_employee(self,data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("INSERT INTO `employee` (`Id`, `Entering_Date`, `Salary`, `Education_Level`, `Title`, `Department`) VALUES  (%s,%s,%s,%s,%s,%s)",
                           (data.get('id'),data[ 'entering' ],data[ 'salary' ],data.get( 'education' ),data[ 'title' ],data.get('department'),))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def insert_human_resources_volunteer(self, data) :
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "INSERT INTO `volunteer` (`Id`, `No_of_Service_Hour`, `Availability`, `Team`, `Mobile_Phone`) VALUES  (%s,%s,%s,%s,%s)",
                (data.get('id'), data['hour'], data['availability'], data.get('team'),
                 data['mobile'],))
            con.commit()

            return True
        except :
            con.rollback()

            return False
        finally :
            con.close()
    def insert_donor(self, data) :
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "INSERT INTO `donor` (`Name`, `Phone_Number`, `Email`, `Number`, `SName`, `Suburb`, `Pcode`) VALUES   (%s,%s,%s,%s,%s,%s,%s)",
                (data['name'], data['phone'], data['email'], data['number'],data['sname'],data['subrub'],
                 data['postcode'],))
            con.commit()

            return True
        except :
            con.rollback()

            return False
        finally :
            con.close()
    def read_volunteer_id(self):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("SELECT * FROM `volunteer`")

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_volunteer_id_s(self,data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("select * from volunteer where id=%s",data,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def update_volunteer(self, id, data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("UPDATE `volunteer` SET `Availability`  = %s, `Mobile_Phone` = %s WHERE `volunteer`.`Id` = %s", (data['availability'],data['mobile'],id,))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def delete_volunteer(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("DELETE FROM volunteer where id = %s", (id,))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def delete_human_resources(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("DELETE FROM human_resource where id = %s", (id,))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def read_donor_2(self,id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT Donor_Id, Phone_Number FROM `donor`")
            else:
                cursor.execute("SELECT * FROM `donor`", (id,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def is_valid(self,data, username, password) :
        for row in data :
            if row[ 0 ] == username and row[ 2 ] == password :
                return True
        return False

    def read_donor_3(self, email):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if email == None:
                cursor.execute("SELECT * FROM donor")
            else:
                cursor.execute("select * from donor where Email=%s",email,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def update_donor(self, id, data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("UPDATE `donor` SET `Phone_Number` = %s, `Email` = %s, `Number` = %s, `SName` = %s, `Suburb` = %s, `Pcode` = %s WHERE `donor`.`Donor_id` = %s", (data['phone'],data['email'],data['number'],data['sname'],data['subrub'],data['postcode'],id,))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()

    def read_donation(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `donations`")
            else:
                cursor.execute("SELECT * FROM `donations` where Donor_Id=%s", id,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def read_product(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM category")
            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def insert_donation(self, id, date,data) :
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "INSERT INTO `donations` (`Delivered_Day`, `Created_Day`, `Description_Product`, `Weight`, `Expired_Date`, `Donation_Status`, `Donor_Id`, `Delivery_Mode`) VALUES   (%s,%s,%s,%s,%s,'Active',%s,%s )",
                (data['deliver'], date, data.get('description'), data['weight'],data['expire'],id,data.get('mode')))
            con.commit()

            return True
        except :
            con.rollback()

            return False
        finally :
            con.close()

    def is_valid_r(self, data, username, password) :
        for row in data:
            if row[ 0 ] == username and row[ 8 ] == password :
                return True
        return False

    def read_collection(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `collection_centre`")
            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def insert_recipient(self, data) :
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute("INSERT INTO `recipient` (`Name`, `Number`, `SName`, `Pcode`, `Subrub`, `Diet_Requirement`, `Home_Telephone`, `Mobile_Phone`, `Email`, `Centre_Id`) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",
                           (data['name'], data['snumber'], data['sname'], data['postcode'], data['subrub'], data['diet'],data['home'],data['phone'],data['email'],data.get('cid')))
            con.commit()

            return True
        except :
            con.rollback()

            return False
        finally :
            con.close()
    def read_recipient_2(self, email):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if email == None:
                cursor.execute("SELECT * FROM `recipient`")
            else:
                cursor.execute("SELECT * FROM `recipient` where Email=%s", (email,))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def update_recipient(self, id, data):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("UPDATE `recipient` SET `Number` = %s, `SName` = %s, `Pcode` = %s, `Subrub` = %s, `Diet_Requirement` = %s, `Home_Telephone` = %s, `Mobile_Phone` = %s, `Email` = %s WHERE `recipient`.`R_Id` = %s", (data['snumber'],data['sname'],data['postcode'],data['subrub'],data['diet'],data['home'],data['phone'],data['email'],id,))
            con.commit()

            return True
        except:
            con.rollback()

            return False
        finally:
            con.close()


    def read_order(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("Select o.Required_Day,o.Created_Day,o.Transfer_Day,o.Category_Name,o.Weight,o.Other_Details,d.Description_Product,d.Expired_Date from orders o left join transact t ON o.Order_Id=t.Order_Id left join donations d on t.Donation_Id= d.Donation_Id")
            else:
                cursor.execute("Select o.Required_Day,o.Created_Day,o.Transfer_Day,o.Category_Name,o.Weight,o.Other_Details,d.Description_Product,d.Expired_Date from orders o left join transact t ON o.Order_Id=t.Order_Id left join donations d on t.Donation_Id= d.Donation_Id where o.R_id=%s", id,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()



    def read_category(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `big_category`")
            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def insert_order(self, id, date, data) :
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "INSERT INTO `orders` (`Category_Name`, `Weight`, `Required_Day`, `Created_Day`, `Other_Details`, `Transfer_Day`, `R_id`, `Allocated`) VALUES (%s,%s,%s,%s,%s,NULL,%s,'0')",
                (data.get('category'), data[ 'weight' ], data[ 'require' ], date, data[ 'other' ],id,))
            con.commit()

            return True
        except :
            con.rollback()

            return False
        finally :
            con.close()

    def read_community(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("SELECT * FROM `collection_centre`")
            else:
                cursor.execute("SELECT * FROM `collection_centre` where Centre_Id=%s", id,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def is_valid_c(self, data, username, password) :
        for row in data:
            if row[ 0 ] == username and row[ 10 ] == password :
                return True
        return False

    def read_order_community(self, id,date):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("Select o.Order_Id,o.Required_Day,o.Transfer_Day,r.Name,o.Category_Name,o.Weight,o.Other_Details,d.Description_Product,d.Expired_Date from orders o left join transact t ON o.Order_Id=t.Order_Id left join donations d on t.Donation_Id= d.Donation_Id left join recipient r on o.R_id= r.R_Id where r.Centre_Id=5 and o.Required_Day>=%s ORDER by o.Required_Day asc",date)
            else:
                cursor.execute("Select o.Order_Id,o.Required_Day,o.Transfer_Day,r.Name,o.Category_Name,o.Weight,o.Other_Details,d.Description_Product,d.Expired_Date from orders o left join transact t ON o.Order_Id=t.Order_Id left join donations d on t.Donation_Id= d.Donation_Id left join recipient r on o.R_id= r.R_Id where r.Centre_Id=%s and o.Required_Day>=%s ORDER by o.Required_Day asc",(id,date))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def read_inventory(self):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            cursor.execute("SELECT c.Category_Name,sum(i.R_Weight) FROM donations d, inventory_remain i, category c where d.Donation_Id=i.Donation_Id and d.Description_Product=c.Description_Product GROUP by c.Category_Name")
            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
    def read_inventory_small_group(self,data):
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "select d.Donation_Id,c.Category_Name, c.Description_Product,i.R_Weight,d.Expired_Date from donations d, inventory_remain i,category c where d.Donation_Status='Active' and d.Donation_Id=i.Donation_Id and d.Description_Product=c.Description_Product and c.Category_Name=%s and expired_Date>=%s and expired_Date<%s ORDER BY Expired_Date, Description_Product",(data.get('category'),data['expires'],data['expireb']))
            return cursor.fetchall()
        except :
            return ()
        finally :
            con.close()

    def read_order_2(self):
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "select * from orders where Allocated=0")
            return cursor.fetchall()
        except :
            return ()
        finally :
            con.close()

    def read_donation_match(self,id):
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "SELECT i.`Donation_Id`,i.`Category_Name`,i.`Description_Product`,i.`R_Weight`,i.`Expired_Date` FROM `inventory_leave_item` i WHERE i.`Category_Name`=(select o.Category_Name from orders o where o.Order_Id=%s) and `Expired_Date`>=(select o.Required_Day from orders o where o.Order_Id=%s)+7 and Delivered_Day<=(select o.Required_Day from orders o where o.Order_Id=%s) and R_Weight>=(select o.Weight from orders o where o.Order_Id=%s)",(id,id,id,id,))
            return cursor.fetchall()
        except :
            return ()
        finally :
            con.close()
    def read_orders_weight(self, id):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if id == None:
                cursor.execute("select weight from orders")
            else:
                cursor.execute("select weight from orders where order_id=%s", id,)

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()

    def insert_donation_order(self, did, oid,weight) :
        con = Database.connect(self)
        cursor = con.cursor()

        try :
            cursor.execute(
                "INSERT INTO transact (`Donation_Id`, `Order_Id`, `Weight`) VALUES   (%s,%s,%s)",
                (did, oid, weight))
            con.commit()

            return True
        except :
            con.rollback()

            return False
        finally :
            con.close()
