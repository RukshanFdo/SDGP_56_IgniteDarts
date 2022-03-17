import pymongo
from pymongo import MongoClient

cluster = MongoClient("mongodb+srv://AvishkaAttygalle:ju5t4fun@cluster0.u76jc.mongodb.net/kokiyadb?retryWrites=true&w=majority" )
db = cluster["kokiyadb"]
collection = db["recipesNew"]

#results = collection.find({"core ingredient 1": "tomato","core ingredient 3": "greenchili"})

results1  = db.recipesNew.find({
  "core ingredient 1": "cassava" ,"core ingredient 3": "redchili"  
})


for result in results1:
    print(result)

results2 = db.recipesNew.find({
  "core ingredient 5": "coconut" ,
  "category2":"sweet"
})

for result in results2:
    print(result)
