from flask import Flask , jsonify, render_template, request, flash, redirect, url_for, session
import generation
import hashPassword
import MySQLdb 

app = Flask(__name__)

print("Connecting to database using MySQLdb") 
db_connection = MySQLdb.connect(host="localhost",user="root",password="",db="apollo") 
print("Succesfully Connected to database using MySQLdb!")

@app.route('/')
def index():
    return render_template('index.html')

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
			return render_template("home.html")

		else:
			return  "failed"
		
	else:
		return "failed"

	


@app.route('/beethoven')
def beethoven():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 1 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	print(rowsReturned)
	return render_template('beethoven.html')

@app.route('/bach')
def bach():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 2 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	print(rowsReturned)
	return render_template('bach.html')

@app.route('/mozart')
def mozart():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 3 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	print(rowsReturned)
	return render_template('mozart.html')

@app.route('/chopin')
def chopin():
	cursor = db_connection.cursor()
	cursor.execute('SELECT * FROM songs WHERE artistID = 4 ORDER BY RAND() LIMIT 5')
	rowsReturned = cursor.fetchall()
	print(rowsReturned)
	return render_template('chopin.html')

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

@app.route('/logout')
def logout():
	session.pop('email', None)
	return render_template('index.html')
    


@app.route('/home')
def login():
    return render_template('home.html')





if __name__ == '__main__':
	app.secret_key = "secret key"
	app.run(debug=True , host = '192.168.1.101')