# modules to make this work, flask for api end point, dbhelpers for connection, json for data in json

from flask import Flask, request, make_response
import dbhelpers as dh
import json
import apihelper as a

app = Flask(__name__)

@app.get('/api/philosopher')
# returns philopher's id, name, bio, dob, dod, image_url in json
def all_philosopher():

    result = dh.run_statement('CALL show_all_philosopher()')
    # checks to see if result is a list
    if(type(result) == list):
        # https response, 200 = success, 400 = fail
        return make_response(json.dumps(result, default=str), 200)
    
    else:
        return make_response(json.dumps(result, default=str), 400)


# insert a new philosopher by providing name, bio, dob, dod, image_url and it returns the id
@app.post('/api/philosopher')

def add_new_philosopher():
    name_input = request.json.get('name')
    bio = request.json.get('bio')
    dob = request.json.get('dob')
    dod = request.json.get('dod')
    img_url = request.json.get('img_url')

    # checking to see if each value that is entered by client is a str, if not it stops there
    valid_check = a.check_endpoint_info(request.json, ['name', 'bio', 'dob', 'dod', 'img_url'])
    if(type(valid_check) == str):
        return valid_check

    result = dh.run_statement('CALL add_philosopher(?,?,?,?,?)', [name_input, bio, dob, dod, img_url])
    if(type(result) == list):
        # using make response to make it easier for me to debug
        # http response 200 = success, 400 = connection problem
        return make_response(json.dumps(result, default=str), 200)
      
    else:
        return make_response(json.dumps(result, default=str), 400)

@app.get('/api/quote')
# return all quotes, quote's id, philosopher's name from a given philosopher's id
def all_quote_by_philosopher_id():
    id = request.args.get('id')
    # checking to see if each value that is entered by client is a str, if not it stops there
    valid_check = a.check_endpoint_info(request.args, ['id'])
    if(type(valid_check) == str):
        return valid_check

    result = dh.run_statement('CALL show_quote_by_id(?)', [id])
    # checks to see if result is a list
    if(type(result) == list):
        # https response, 200 = success, 400 = fail
        return make_response(json.dumps(result, default=str), 200)
    
    else:
        return make_response(json.dumps(result, default=str), 400)

@app.post('/api/quote')
# using philosopher id insert content into quote table and return id of quote
def insert_quote():
    id = request.json.get('id')
    content = request.json.get('content')
 
    # checking to see if each value that is entered by client is a str, if not it stops there
    valid_check = a.check_endpoint_info(request.json, ['id', 'content'])
    if(type(valid_check) == str):
        return valid_check

    result = dh.run_statement('CALL insert_quote(?,?)', [id, content])
    if(type(result) == list):
        
        # http response 200 = success, 400 = connection problem
        return make_response(json.dumps(result, default=str), 200)
      
    else:
        return make_response(json.dumps(result, default=str), 400)

        

app.run(debug=True)