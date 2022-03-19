import pymongo
from pymongo import MongoClient

cluster = MongoClient("mongodb+srv://AvishkaAttygalle:ju5t4fun@cluster0.u76jc.mongodb.net/kokiyadb?retryWrites=true&w=majority" )
db = cluster["kokiyadb"]
collection = db["recipesNew"]

flavour = input("Search recipe name : ")

result_4 = collection.find({"category2" : flavour})

for i in result_4:
    print('{0} \n\n{1} \n\n{2} \n\n{3} \n\n{4}'.format(i['recipe'], 
        i['imagesrc'],
        i['ingredient'],
        i['insructions'],
        i['notes']))