import os
from flask import Flask, flash, render_template, redirect, url_for, request, session
from database import Database
from datetime import date



app = Flask(__name__)
app.secret_key = os.urandom(12)
db = Database()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/admin')
def admin():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    return render_template('admin.html')

@app.route('/loginadmin')
def loginadmin():
    if 'username' in session:
        return redirect(url_for('admin'))
    else:
        return render_template('loginadmin.html', error='')

@app.route('/admin_people')
def admin_people():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    else:
        return render_template('admin_people.html', error='')



@app.route("/login", methods = ['POST', 'GET'])
def login():
    secretusername="admin"
    secretpassword="1234"
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username==secretusername and secretpassword==password:
            session['username'] = username
            flash('You were successfully logged in')
            return redirect(url_for('admin'))
        else:
            error = 'Invalid UserName / Password'
            return render_template('loginadmin.html', error=error)


@app.route("/logout", methods = ['POST', 'GET'])
def logout():
    session.pop('username', None)
    return redirect(url_for('loginadmin'))

@app.route("/donor")
def donor():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_donor(None)
    return render_template('Donor.html', data = data)

@app.route("/recipient")
def recipient():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_recipient(None)
    return render_template('Recipient.html', data = data)

@app.route("/human_resource")
def human_resource():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_employee(None), db.read_volunteer(None)
    return render_template('human_resource.html', data = data)

@app.route('/add_human_resources/')
def add_human_resources():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    return render_template('add_human_resources.html')

@app.route('/add_human_resources_main', methods = ['POST', 'GET'])
def add_human_resources_main():
    if request.method == 'POST' and request.form['submit']:
        successful=db.insert_human_resources(request.form)
        if successful:
            data=db.read_human_resources(request.form['email'])
            flash('Insert Successfully. The human resources id is '+str(data[0][0]))
            return redirect(url_for('add_human_resources_group'))
        else:
            flash('Insert not successful')
            return redirect(url_for('add_human_resources'))
    else:
        return redirect(url_for('add_human_resources'))

@app.route('/add_human_resources_group/')
def add_human_resources_group():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    return render_template('add_human_resources_group.html')

@app.route('/add_human_resources_employee/')
def add_human_resources_employee():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_not_id()
    return render_template('add_human_resources_employee.html', data=data)

@app.route('/addphone4', methods = ['POST', 'GET'])
def addphone4():
    if request.method == 'POST' and request.form['save']:
        sucessful=db.insert_human_resources_employee(request.form)
        if sucessful:
            flash('Successfully add')
            return redirect(url_for('human_resource'))
        else:
            flash('Cannot add')
            return redirect(url_for('add_human_resources_employee'))
    else:
        return redirect(url_for('human_resource'))

@app.route('/add_human_resources_volunteer/')
def add_human_resources_volunteer():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_not_id()
    return render_template('add_human_resources_volunteer.html', data=data)

@app.route('/addvolunteer', methods = ['POST', 'GET'])
def addvolunteer():
    if request.method == 'POST' and request.form['save']:
        successful=db.insert_human_resources_volunteer(request.form)
        if successful:
            flash('Successfully add')
            return redirect(url_for('human_resource'))
        else:
            flash('Cannot add')
            return redirect(url_for('add_human_resources_volunteer'))
    else:
        return redirect(url_for('human_resource'))

@app.route('/update_volunteer_search/')
def update_volunteer_search():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_volunteer_id()
    return render_template('update_volunteer_search.html', data=data)

@app.route('/add_search_volunteer', methods = ['POST', 'GET'])
def addvolunteer_1():
    if request.method == 'POST' and request.form['save']:
        successful=db.insert_human_resources_volunteer(request.form)
        if successful:
            flash('Successfully add')
            return redirect(url_for('human_resource'))
        else:
            flash('Cannot add')
            return redirect(url_for('add_human_resources_volunteer'))
    else:
        return redirect(url_for('human_resource'))

@app.route('/update_page_volunteer/', methods = ['POST', 'GET'])
def update_page_volunteer():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    if request.method == 'POST' and request.form[ 'save' ] :
        data = db.read_volunteer_id_s(request.form.get('id'))
        return render_template('update_page_volunteer.html', data=data)
    else:
        return render_template(url_for('human_resource'))

@app.route('/update_volunteer', methods = ['POST', 'GET'])
def update_volunteer():
    if request.method == 'POST' and request.form['save']:
        successful=db.update_volunteer(request.form.get('id'),request.form)
        if successful:
            flash('Successfully update')
            return redirect(url_for('human_resource'))
        else:
            flash('Cannot update')
            return redirect(url_for('update_page_volunteer'))
    else:
        return redirect(url_for('human_resource'))

@app.route('/delete_volunteer_search/')
def delete_volunteer_search():
    if 'username' not in session :
        return redirect(url_for('loginadmin'))
    data = db.read_volunteer_id()
    return render_template('delete_volunteer_search.html', data=data)

@app.route('/delete_volunteer', methods = ['POST', 'GET'])
def delete_volunteer():
    if request.method == 'POST' and request.form['save']:
        #successful=db.delete_volunteer(request.form.get('id'))
        successful2 = db.delete_human_resources(request.form.get('id'))
        if successful2:
            flash('Successfully delete')
            return redirect(url_for('human_resource'))
        else:
            flash('Cannot delete')
            return redirect(url_for('delete_volunteer_search'))
    else:
        return redirect(url_for('human_resource'))


@app.route('/logindonor')
def logindonor():
    if 'username1' in session:
        return redirect(url_for('donor_main'))
    else:
        return render_template('logindonor.html', error='')

@app.route("/login_donor_f", methods = ['POST', 'GET'])
def login_donor_f():
    if request.method == 'POST':
        try:
            username = int(request.form['username'])
        except:
            error = 'Invalid UserName / Password'
            return render_template('logindonor.html', error=error)
        password = request.form['password']
        data=db.read_donor(None)
        successful=db.is_valid(data,username,password)
        if successful:
            session['username1'] = username
            data2=db.read_donor(session['username1'])
            flash('Welcome Back. '+str(data2[0][1]))
            return redirect(url_for('donor_main'))
        else:
            error = 'Invalid UserName / Password'
            return render_template('logindonor.html', error=error)



@app.route('/donor_main')
def donor_main():
    if 'username1' not in session:
        return redirect(url_for('logindonor'))
    return render_template('donor_main.html')

@app.route("/logout_donor", methods = ['POST', 'GET'])
def logout_donor():
    session.pop('username1', None)
    return redirect(url_for('logindonor'))

@app.route('/registerdonor/')
def registerdonor():
    if 'username1' in session:
        return redirect(url_for('donor_main'))
    else:
        return render_template('Registerdonor.html', error='')

@app.route('/adddonor', methods = ['POST', 'GET'])
def adddonor():
    if request.method == 'POST' and request.form['submit']:
        successful=db.insert_donor(request.form)
        if successful:
            data = db.read_donor_3(request.form[ 'email' ])
            flash('Insert Successfully. Your donor_id is ' + str(data[ 0 ][ 0 ]))
            return redirect(url_for('logindonor'))
        else:
            flash('Cannot add')
            return redirect(url_for('logindonor'))
    else:
        return redirect(url_for('logindonor'))

@app.route('/donor_detail')
def donor_detail():
    if 'username1' not in session:
        return redirect(url_for('logindonor'))
    data=db.read_donor(session['username1'])
    return render_template('Donor_Details.html',data=data)

@app.route('/update_donor', methods = ['POST', 'GET'])
def update_donor():
    if request.method == 'POST' and request.form['save']:
        successful=db.update_donor(session['username1'],request.form)
        if successful:
            flash('Successfully update')
            return redirect(url_for('donor_main'))
        else:
            flash('Cannot update')
            return redirect(url_for('donor_main'))

@app.route('/donor_donations')
def donor_donations():
    if 'username1' not in session:
        return redirect(url_for('logindonor'))
    data=db.read_donation(session['username1'])
    return render_template('donor_donations.html',data=data)

@app.route('/add_donations')
def add_donations():
    if 'username1' not in session:
        return redirect(url_for('logindonor'))
    data=db.read_product(None)
    return render_template('add_donations.html',data=data)

@app.route('/adddonation', methods = ['POST', 'GET'])
def adddonation():
    if request.method == 'POST' and request.form['submit']:
        today = date.today()
        successful=db.insert_donation(session['username1'],today,request.form)
        if successful:
            flash('Insert Successfully.')
            return redirect(url_for('add_donations'))
        else:
            flash('Cannot add')
            return redirect(url_for('add_donations'))
    else:
        return redirect(url_for('add_donations'))

@app.route('/loginrecipient')
def loginrecipient():
    if 'username2' in session:
        return redirect(url_for('recipient_main'))
    else:
        return render_template('loginrecipient.html', error='')

@app.route("/login_recipient_f", methods = ['POST', 'GET'])
def login_recipient_f():
    if request.method == 'POST':
        try:
            username = int(request.form['username'])
        except:
            error = 'Invalid UserName / Password'
            return render_template('loginrecipient.html', error=error)
        password = request.form['password']
        data=db.read_recipient(None)
        successful=db.is_valid_r(data,username,password)
        if successful:
            session['username2'] = username
            data2=db.read_recipient(session['username2'])
            flash('Welcome Back. '+str(data2[0][1]))
            return redirect(url_for('recipient_main'))
        else:
            error = 'Invalid UserName / Password'
            return render_template('loginrecipient.html', error=error)

@app.route('/recipient_main')
def recipient_main():
    if 'username2' not in session:
        return redirect(url_for('loginrecipient'))
    return render_template('recipient_main.html')

@app.route("/logout_recipient", methods = ['POST', 'GET'])
def logout_recipient():
    session.pop('username2', None)
    return redirect(url_for('loginrecipient'))

@app.route('/register_recipient')
def register_recipient():
    data=db.read_collection(None)
    return render_template('Registerrecipient.html',data=data)

@app.route('/addrecipient', methods = ['POST', 'GET'])
def addrecipient():
    if request.method == 'POST' and request.form['submit']:
        successful=db.insert_recipient(request.form)
        if successful:
            data = db.read_recipient_2(request.form['email'])
            flash('Insert Successfully. Your donor_id is '+ str(data[ 0 ][ 0 ]))
            return redirect(url_for('loginrecipient'))
        else:
            flash('Cannot add')
            return redirect(url_for('loginrecipient'))
    else:
        return redirect(url_for('loginrecipient'))

@app.route('/recipient_detail')
def recipient_detail():
    if 'username2' not in session:
        return redirect(url_for('loginrecipient'))
    data=db.read_recipient(session['username2'])
    return render_template('Recipient_Details.html',data=data)

@app.route('/update_recipient', methods = ['POST', 'GET'])
def update_recipient():
    if request.method == 'POST' and request.form['submit']:
        successful=db.update_recipient(session['username2'],request.form)
        if successful:
            flash('Successfully update')
            return redirect(url_for('recipient_main'))
        else:
            flash('Cannot update')
            return redirect(url_for('recipient_main'))

@app.route('/recipient_order')
def recipient_order():
    if 'username2' not in session:
        return redirect(url_for('loginrecipient'))
    data=db.read_order(session['username2'])
    return render_template('recipient_order.html',data=data)

@app.route('/add_order')
def add_order():
    if 'username2' not in session:
        return redirect(url_for('loginrecipient'))
    data=db.read_category(None)
    return render_template('add_order.html',data=data)

@app.route('/addorder', methods = ['POST', 'GET'])
def addorder():
    if request.method == 'POST' and request.form['submit']:
        today = date.today()
        successful=db.insert_order(session['username2'],today,request.form)
        if successful:
            flash('Insert Successfully.')
            return redirect(url_for('recipient_order'))
        else:
            flash('Cannot add')
            return redirect(url_for('add_order'))
    else:
        return redirect(url_for('add_order'))

@app.route('/logincommunity')
def logincommunity():
    if 'username3' in session:
        return redirect(url_for('community_main'))
    else:
        return render_template('logincommunity.html', error='')

@app.route("/login_community_f", methods = ['POST', 'GET'])
def login_community_f():
    if request.method == 'POST' and request.form['submit']:
        try:
            username = int(request.form['username'])
        except:
            error = 'Invalid UserName / Password'
            return render_template('logincommunity.html', error=error)
        password = request.form['password']
        data=db.read_community(None)
        successful=db.is_valid_c(data,username,password)
        if successful:
            session['username3'] = username
            data2=db.read_community(username)
            flash('Welcome Back. '+str(data2[0][1]))
            return redirect(url_for('community_main'))
        else:
            error = 'Invalid UserName / Password'
            return render_template('logincommunity.html', error=error)

@app.route('/community_main')
def community_main():
    if 'username3' not in session:
        return redirect(url_for('logincommunity'))
    return render_template('community_main.html')


@app.route("/logout_community", methods = ['POST', 'GET'])
def logout_community():
    session.pop('username3', None)
    return redirect(url_for('logincommunity'))

@app.route("/community_recipient")
def community_recipient():
    if 'username3' not in session :
        return redirect(url_for('logincommunity'))
    data = db.read_recipient_3(session['username3'])
    return render_template('community_recipient.html', data = data)

@app.route('/order_community')
def order_community():
    if 'username3' not in session:
        return redirect(url_for('logincommunity'))
    today = date.today()
    data=db.read_order_community(session['username3'],today)
    return render_template('order_community.html',data=data)

@app.route('/admin_inventory')
def admin_inventory():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    return render_template('admin_inventory.html')
@app.route('/inventory_remain_all')
def inventory_remain_all():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    data=db.read_inventory()
    return render_template('inventory_remain_all.html',data=data)

@app.route('/remaining_inventory_queries')
def remaining_inventory_queries():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    data=db.read_category(None)
    return render_template('remaining_inventory_queries.html',data=data)

@app.route("/remaining_inventory_small", methods = ['POST', 'GET'])
def remaining_inventory_small():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    if request.method == 'POST' and request.form['submit']:
        data=db.read_inventory_small_group(request.form)
        return render_template('inventory_remaining_queries_answer.html', data=data)

@app.route('/order_need_update')
def order_need_update():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    data=db.read_order_2()
    return render_template('order_need_update.html',data=data)

@app.route("/donations_match", methods = ['POST', 'GET'])
def donations_match():
    if 'username' not in session:
        return redirect(url_for('loginadmin'))
    if request.method == 'POST' and request.form['submit']:
        id=request.form.get('id')
        session[ 'orderid' ] =id
        data=db.read_donation_match(id)
        return render_template('donations_match.html', data=data)


@app.route('/donation_addorder', methods = ['POST', 'GET'])
def donation_addorder():
    if request.method == 'POST' and request.form['submit']:
        data=db.read_orders_weight(session['orderid'])
        successful=db.insert_donation_order(request.form.get('id'),session[ 'orderid' ],data[0][0])
        if successful:
            flash('Insert Successfully.')
            session.pop('orderid', None)
            return redirect(url_for('order_need_update'))
        else:
            flash('Cannot add')
            return redirect(url_for('order_need_update'))
    else:
        return redirect(url_for('order_need_update'))

@app.route('/contactus')
def contact_us():
    return render_template('ContactUs.html')

if __name__ == '__main__':
    app.run(debug=True)
