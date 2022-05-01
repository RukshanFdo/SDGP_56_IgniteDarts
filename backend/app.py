from itertools import count
import mysql.connector
import flask
from flask import request,jsonify
from flask import Flask
from flask_cors import CORS,cross_origin

app = Flask(__name__)
CORS(app,resourcess={r"/*": {"origins": "*"}})
app.config['CORS_HEADERS'] = 'Content-Type'
app.config["DEBUG"] = True

def initDb():
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="recipe"
    )
    return mydb

@app.route('/', methods=['GET'])
@cross_origin()
def home():
    mydb = initDb()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM recipe")
    myresult = mycursor.fetchall()
    myResult = jsonify(myresult)    
    return (myResult)


@app.route('/getbyname', methods=['POST'])
def getbyname():
    mydb = initDb()
    mycursor = mydb.cursor()
    name = request.args['name']
    mycursor.execute("SELECT * FROM recipe WHERE name LIKE '%"+name+"%'")
    myresult = mycursor.fetchall()
    
    return str(myresult)


@app.route('/getbyingredient', methods=['GET'])
def getbyingredient():
    mydb = initDb()
    mycursor = mydb.cursor()
    #get ingredients from the request
    ingredients = request.args['ingredients']
    #split the ingredients
    ingredients = ingredients.split(",")
    #get the recipes which have the two or more ingredients
    myresult=[]
    for i in range(1,len(ingredients)):
        mycursor.execute("SELECT DISTINCT * FROM recipe WHERE ingredient LIKE '%"+ingredients[i]+"%'")
        myresult.append(mycursor.fetchall())

    finalresult=[]
    #go though the my results list and find the recipes which have two or more ingredients
    for i in range(0,len(myresult)):
        for j in range(0,len(myresult[i])):
            
            count=0
            for k in range(0,len(ingredients)):
                if ingredients[k].lower() in myresult[i][j][3].lower():
                    count+=1
            if count>=2:
                # if ({"recipe":myresult[i][j]}) in finalresult:
                #     continue
                # else:
                #     finalresult.append({"recipe":myresult[i][j],"count":count,"time":int(myresult[i][j][6]),"inverse_time":10000-int(myresult[i][j][6])})
                finalresult.append({"recipe":myresult[i][j],"count":count,"time":int(myresult[i][j][6]),"inverse_time":10000-int(myresult[i][j][6])})
    finalresult = list(map(dict, set(tuple(d.items()) for d in finalresult)))
    finalresult.sort(key=lambda x: (x['count'],x['inverse_time']),reverse=True)
    #remove inverse_time column from finalresult
    for i in range(0,len(finalresult)):
        finalresult[i].pop('inverse_time')
    # uniquelist = list(set(x['recipe'][0] for x in finalresult))
    # response = [d for d in finalresult if (d['recipe'][0] in uniquelist): uniquelist.pop(d['recipe'][0])]
    #     
    # # uniquelist.pop(d['recipe'][0])
        # reponse.append(d)
    #print(type(finalresult))
    return jsonify(finalresult)


@app.route('/getbycategory', methods=['POST'])
def getbycategory():
    mydb = initDb()
    mycursor = mydb.cursor()
    #get category from the request
    category = request.args['category']
    value = request.args['value']
    #get the recipes which have the category
    print("SELECT * FROM recipe WHERE "+category+" LIKE '%"+value+"%'")
    mycursor.execute("SELECT * FROM recipe WHERE "+category+" LIKE '%"+value+"%'")
    myresult = mycursor.fetchall()
    return str(myresult)

# with app.test_client() as c:
#     test_result = c.get('/')
#     json_data = test_result.get_json()
#     assert json_data == ''

with app.test_client() as c:
    test_result = c.post('/getbyname', json={
        'name': 'Test Recipe'
    })
    json_data = test_result.get_json()
    assert json_data == "[('Test Recipe', 'https://www.topsrilankanrecipe.com/wp-content/uploads/2021/06/6a-2.jpg', 'test1, test2, test3, test4, test5', 'Data record for unit testing purposes', 'vegetarian', 'spicy', '10')]"

with app.test_client() as c:
    test_result = c.get('/getbyingredient', json={
        'ingredients': 'test, test, test, test, test'
    })
    json_data = test_result.get_json()
    assert json_data == '[{"count":5,"recipe":["Test Recipe","https://www.topsrilankanrecipe.com/wp-content/uploads/2021/06/6a-2.jpg","test1, test2, test3, test4, test5","Data record for unit testing purposes","filter1","filter2","10"],"time":10}]'

with app.test_client() as c:
    test_result = c.post('/getbycategory', json={
        'category': 'category1',
        'value': 'filter1'
    })
    json_data = test_result.get_json()
    assert json_data == "[('Test Recipe', 'https://www.topsrilankanrecipe.com/wp-content/uploads/2021/06/6a-2.jpg', 'test1, test2, test3, test4, test5', 'Data record for unit testing purposes', 'filter1', 'filter2', '10')]"






