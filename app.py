from flask import Flask , jsonify, render_template, request, flash, redirect, url_for, session
import generation
import hashPassword
import pymysql
import jinja2
import json

app = Flask(__name__)

print("Connecting to database using MySQLdb") 
db_connection = pymysql.connect(host="localhost",user="root",password="",db="apollo") 
print("Succesfully Connected to database using MySQLdb!")
beethoven_songs = []
bach_songs = []
chopin_songs = []
mozart_songs = []
artistNames = ["beethoven" , "bach" , "mozart" , "chopin"]

@app.route('/' , methods = ['GET' , 'POST'])
def index():
    return render_template('index.html')	
def handle_request():
    return "Flask Server & Android are Working Successfully"

@app.route('/mobile' , methods = ['GET' , 'POST'])
def chat():
    msg_received = request.get_json()
    print(msg_received)
    return mobilelogin(msg_received)
    

def register(msg_received):
	firstname = msg_received["firstname"]
	lastname = msg_received["lastname"]
	username = msg_received["username"]
	password = msg_received["password"]

	select_query = "SELECT * FROM users where username = " + "'" + username + "'"
	db_cursor.execute(select_query)
	records = db_cursor.fetchall()
	if len(records) != 0:
		return "Another user used the username. Please chose another username."
	
	insert_query = "INSERT INTO users (first_name, last_name, username, password) VALUES (%s, %s, %s, MD5(%s))"
	insert_values = (firstname, lastname, username, password)
	try:
		db_cursor.execute(insert_query, insert_values)
		chat_db.commit()
		return "success"
	except Exception as e:
		print("Error while inserting the new record :", repr(e))
		return "failure"

def mobilelogin(msg_received):
	email = msg_received["email"]
	password = msg_received["password"]
	hashedPassword = hashPassword.hashedPassword(password)
	cursor = db_connection.cursor()
	cursor.execute("SELECT email FROM users WHERE email ='"+email+"'")
	emailReturned = cursor.fetchone()
	print(emailReturned[0])
	cursor.execute("SELECT password FROM users WHERE email ='"+email+"'")
	passwordReturned = cursor.fetchone()
	print(passwordReturned[0])

	if emailReturned[0] == email:
		if passwordReturned[0] == hashedPassword:
			session['email'] = emailReturned
			print(session)
			#return render_template("home.html")
			return "success"

		else:
			return  "failure"
		
	else:
		return "failure"

	if len(records) == 0:
		return "failure"
	else:
		return "success"


@app.route("/mobileArtist", methods=["GET", "POST"])
def artistFinder():
	msg_received = request.get_json()
	print(msg_received)
	name = msg_received["Artist Name"]
	print(name)
	if name in artistNames:
		#return "success"
		print("Hopefully executing")
		if name == artistNames[0]:
			songName = generation.generate(0)
			print(songName)
			return "success"
		elif name == artistNames[1]:
			songName = generation.generate(1)
			print(songName)
			return "success"
		elif name == artistNames[2]:
			songName = generation.generate(2)
			print(songName)
			return "success"
		elif name == artistNames[3]:
			songName = generation.generate(3)
			print(songName)
			return "success"

	else:
		return "failure"


@app.route("/signUp",methods=["POST"])
def signUp():
	username = str(request.form["name"])
	password = str(request.form["password"])
	hashedPassword = hashPassword.hashedPassword(password)
	email = str(request.form["email"])
	
	cursor = db_connection.cursor()
	
	cursor.execute("INSERT INTO users (name,email,password)VALUES(%s,%s,%s)",(username,email, hashedPassword))
	db_connection.commit()
	return render_template("index.html" , success = "Registration Successful")
	
@app.route("/checkUser",methods=["POST"])
def check():
	email = str(request.form["email"])
	print(email)
	password = str(request.form["password"])
	print(password)
	hashedPassword = hashPassword.hashedPassword(password)
	cursor = db_connection.cursor()
	cursor.execute("SELECT email FROM users WHERE email ='"+email+"'")
	emailReturned = cursor.fetchone()
	print(emailReturned[0])

	cursor.execute("SELECT password FROM users WHERE email ='"+email+"'")
	passwordReturned = cursor.fetchone()
	print(passwordReturned[0])
	
	if emailReturned[0] == email:
		if passwordReturned[0] == hashedPassword:
			session['email'] = emailReturned
			print(session)
			#return render_template("home.html")
			return login()

		else:
			return  render_template("index.html" , logInFailed = "*Password doesn't match")
		
	else:
		return render_template("index.html" , logInFailed = "Email doesn't match")

	


@app.route('/beethoven')
def beethoven():
	beethoven_songs.clear()
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 1 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()

	for i in range(0 , len(rowsReturned)):
		row = dict(trackNo= i+1, songName = "static/music/"+rowsReturned[i][1], username = rowsReturned[i][2])
		beethoven_songs.append(row)

	return render_template('beethoven.html' , curatedInfo = beethoven_songs)

@app.route('/bach')
def bach():
	bach_songs.clear()
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 2 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()

	for i in range(0 , len(rowsReturned)):
		row = dict(trackNo= i+1, songName = "static/music/"+rowsReturned[i][1], username = rowsReturned[i][2])
		bach_songs.append(row)
	return render_template('bach.html' , curatedInfo = bach_songs)

@app.route('/mozart')
def mozart():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 3 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	
	for i in range(0 , len(rowsReturned)):
		row = dict(trackNo= i+1, songName = "static/music/"+rowsReturned[i][1], username = rowsReturned[i][2])
		mozart_songs.append(row)
	return render_template('mozart.html' , curatedInfo = mozart_songs)

@app.route('/chopin')
def chopin():
	chopin_songs.clear()
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 4 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	
	for i in range(0 , len(rowsReturned)):
		row = dict(trackNo= i+1, songName = "static/music/"+rowsReturned[i][1], username = rowsReturned[i][2])
		chopin_songs.append(row)

	return render_template('chopin.html' , curatedInfo = chopin_songs)

@app.route('/happy')
def happy():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 5 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	print(rowsReturned)
	return render_template('happy.html' , user1 = rowsReturned[0][2] , user2 = rowsReturned[1][2] , user3 = rowsReturned[2][2] , user4 = rowsReturned[3][2]
		 , user5 = rowsReturned[4][2])

@app.route('/sad')
def sad():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 6 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	print(rowsReturned)
	return render_template('sad.html' , user1 = rowsReturned[0][2] , user2 = rowsReturned[1][2] , user3 = rowsReturned[2][2] , user4 = rowsReturned[3][2]
		 , user5 = rowsReturned[4][2])

@app.route('/loading_beethoven')
def loading():
    songName = generation.generate(0)
    print(songName)
    emailReturned = session['email']
    print("Current ursername = ")
    print(emailReturned[0])
    email = emailReturned[0]
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM users WHERE email ='"+email+"'")
    nameReturned = cursor.fetchone()
    print(nameReturned[0])
    cursor.execute("INSERT INTO songs (songName,ownerName,artistID)VALUES(%s,%s,%s)",(songName, nameReturned[0], 1))
    db_connection.commit()
    return render_template('loading_beethoven.html')


@app.route('/loading_bach')
def loading_bach():
    songName = generation.generate(1)
    emailReturned = session['email']
    print("Current ursername = ")
    print(emailReturned[0])
    email = emailReturned[0]
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM users WHERE email ='"+email+"'")
    nameReturned = cursor.fetchone()
    print(nameReturned[0])
    cursor.execute("INSERT INTO songs (songName,ownerName,artistID)VALUES(%s,%s,%s)",(songName, nameReturned[0], 2))
    db_connection.commit()
    return render_template('loading_bach.html')


@app.route('/loading_mozart')
def loading_mozart():
    songName = generation.generate(2)
    emailReturned = session['email']
    print("Current ursername = ")
    print(emailReturned[0])
    email = emailReturned[0]
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM users WHERE email ='"+email+"'")
    nameReturned = cursor.fetchone()
    print(nameReturned[0])
    cursor.execute("INSERT INTO songs (songName,ownerName,artistID)VALUES(%s,%s,%s)",(songName, nameReturned[0], 3))
    db_connection.commit()
    return render_template('loading_mozart.html')


@app.route('/loading_chopin')
def loading_chopin():
    songName = generation.generate(3)
    emailReturned = session['email']
    print("Current ursername = ")
    print(emailReturned[0])
    email = emailReturned[0]
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM users WHERE email ='"+email+"'")
    nameReturned = cursor.fetchone()
    print(nameReturned[0])
    cursor.execute("INSERT INTO songs (songName,ownerName,artistID)VALUES(%s,%s,%s)",(songName, nameReturned[0], 4))
    db_connection.commit()
    return render_template('loading_chopin.html')


@app.route('/loading_happy')
def loading_happy():
    songName = generation.generate(4)
    emailReturned = session['email']
    print("Current ursername = ")
    print(emailReturned[0])
    email = emailReturned[0]
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM users WHERE email ='"+email+"'")
    nameReturned = cursor.fetchone()
    print(nameReturned[0])
    cursor.execute("INSERT INTO songs (songName,ownerName,artistID)VALUES(%s,%s,%s)",(songName, nameReturned[0], 5))
    db_connection.commit()
    return render_template('loading_happy.html')

@app.route('/loading_sad')
def loading_sad():
    songName = generation.generate(5)
    emailReturned = session['email']
    print("Current ursername = ")
    print(emailReturned[0])
    email = emailReturned[0]
    cursor = db_connection.cursor()
    cursor.execute("SELECT name FROM users WHERE email ='"+email+"'")
    nameReturned = cursor.fetchone()
    print(nameReturned[0])
    cursor.execute("INSERT INTO songs (songName,ownerName,artistID)VALUES(%s,%s,%s)",(songName, nameReturned[0], 6))
    db_connection.commit()
    return render_template('loading_sad.html')



@app.route('/playlist')
def playlist():
	items = []
	email = session['email']
	emailReturned = email[0]
	print(email)
	cursor = db_connection.cursor()
	cursor.execute("SELECT name FROM users WHERE email ='"+emailReturned+"'")
	nameReturned = cursor.fetchone()
	cursor.execute("SELECT uid FROM users WHERE email ='"+emailReturned+"'")
	uidReturned = cursor.fetchone()
	print(uidReturned[0])
	cursor.execute("SELECT * FROM playlist WHERE uid ='"+str(uidReturned[0])+"'")
	playlistReturned = cursor.fetchall()
	print(type(len(playlistReturned)))

	for i in range(0 , len(playlistReturned)):
		row = dict(trackNo = i+1 , songName = "static/music/"+playlistReturned[i][1] , username = playlistReturned[i][1].split("_")[0])
		items.append(row)
	
	print(beethoven_songs)

	return render_template('playlist.html' ,user = nameReturned[0] , item = items)

@app.route('/logout')
def logout():
	session.pop('email', None)
	return render_template('index.html')

@app.route('/background_process_test')
def background_process_test():
	cursor = db_connection.cursor()
	cursor.execute("SELECT songName FROM songs where songID = (SELECT max(songID) FROM songs)")
	songNameReturned = cursor.fetchone()
	print(songNameReturned)
	email = session['email']
	emailReturned = email[0]
	print(email)
	cursor.execute("SELECT name FROM users WHERE email ='"+emailReturned+"'")
	nameReturned = cursor.fetchone()
	print (nameReturned)
	cursor.execute("SELECT uid FROM users WHERE email ='"+emailReturned+"'")
	uidReturned = cursor.fetchone()
	print (uidReturned)
	cursor.execute("INSERT INTO playlist (songName, userName, uid)VALUES(%s,%s,%s)",(songNameReturned[0], nameReturned[0], uidReturned[0]))
	db_connection.commit()

	
	return ("nothing")
    
@app.route('/background_process_test2')
def background_process_test2(songName):
	print(songName)


@app.route('/home')
def login():
    return render_template('home.html')





if __name__ == '__main__':
	app.secret_key = "secret key"
	app.run(debug=True , host = '192.168.1.100')
