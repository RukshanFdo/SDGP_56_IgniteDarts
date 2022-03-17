import pymongo
from pymongo import MongoClient

cluster = MongoClient("mongodb+srv://AvishkaAttygalle:ju5t4fun@cluster0.u76jc.mongodb.net/kokiyadb?retryWrites=true&w=majority" )
db = cluster["kokiyadb"]
collection = db["recipesNew"]

#Removed code line

val1 = input("Enter first ingredient : ")
val2 = input("Enter second ingredient : ")
val3 = input("Enter third ingredient : ")
val4 = input("Enter fourth ingredient : ")
val5 = input("Enter fifth ingredient : ")

result_4 = collection.find({
    "$and" : [{
                 "core ingredient 1" : { "$eq" : val1}
              },
              {
                   "core ingredient 2" : { "$eq" : val2}
              },
              {
                   "core ingredient 3" : { "$eq" : val3}
              },
              {
                   "core ingredient 4" : { "$eq" : val4}
              },
              {
                   "core ingredient 5" : { "$eq" : val5}
              }]              
}) 
for i in result_4:
    print('{0} \n\n{1} \n\n{2} \n\n{3} \n\n{4}'.format(i['recipe'], 
        i['imagesrc'],
        i['ingredient'],
        i['insructions'],
        i['notes']))

result_5 = collection.find({
    "$or" : [{
                 "core ingredient 1" : { "$eq" : val1}
              },
              {
                   "core ingredient 2" : { "$eq" : val2}
              },
              {
                   "core ingredient 3" : { "$eq" : val3}
              },
              {
                   "core ingredient 4" : { "$eq" : val4}
              },
              {
                   "core ingredient 5" : { "$eq" : val5}
              }]              
}) 
for i in result_5:
    print('{0} \n\n{1} \n\n{2} \n\n{3} \n\n{4}'.format(i['recipe'], 
        i['imagesrc'],
        i['ingredient'],
        i['insructions'],
        i['notes']))