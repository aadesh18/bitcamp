# performing flask imports
from flask import Flask,jsonify
import json
import os
from group_pots import get_pots
import analysis as anal


app = Flask(__name__) #intance of our flask application 
pots = get_pots()
pot1 = pots[0]
pot2 = pots[1]
#Route '/' to facilitate get request from our flutter app
@app.route('/', methods = ['GET'])
def index():
    # return_dic = {"key": {}}
    # return_dic['key'].update(pot1)
    # return_dic['key'].update(pot2)


    # li = anal.predict("group1")
    
    # options = {}
    # options["g1p0"] = {"price": anal.get_price(li[0][0]), "beds": anal.get_beds(li[0][0]), "baths": anal.get_baths(li[0][0]), "address": li[0][0], "area": anal.get_area(li[0][0]), "image_link": anal.get_img_link(li[0][0]), "rental_income": anal.get_rental_income(li[0][0]), "break_even_time": anal.break_even_time(li[0][0]), "percentage_increase": anal.percent_increase_valuation(li[0][0])}
    
    # options["g1p1"] = {"price": anal.get_price(li[1][0]), "beds": anal.get_beds(li[1][0]), "baths": anal.get_baths(li[1][0]), "address": li[1][0], "area": anal.get_area(li[1][0]), "image_link": anal.get_img_link(li[1][0]), "rental_income": anal.get_rental_income(li[1][0]), "break_even_time": anal.break_even_time(li[1][0]), "percentage_increase": anal.percent_increase_valuation(li[1][0])}

    # options["g1p2"] = {"price": anal.get_price(li[2][0]), "beds": anal.get_beds(li[2][0]), "baths": anal.get_baths(li[2][0]), "address": li[2][0], "area": anal.get_area(li[2][0]), "image_link": anal.get_img_link(li[2][0]), "rental_income": anal.get_rental_income(li[2][0]), "break_even_time": anal.break_even_time(li[2][0]), "percentage_increase": anal.percent_increase_valuation(li[2][0])}

    # return_dic["key"]["group1_rec"] = options



    # li = anal.predict("group2")
    
    # options = {}
    # options["g2p0"] = {"price": anal.get_price(li[0][0]), "beds": anal.get_beds(li[0][0]), "baths": anal.get_baths(li[0][0]), "address": li[0][0], "area": anal.get_area(li[0][0]), "image_link": anal.get_img_link(li[0][0]), "rental_income": anal.get_rental_income(li[0][0]), "break_even_time": anal.break_even_time(li[0][0]), "percentage_increase": anal.percent_increase_valuation(li[0][0])}
    
    # options["g2p1"] = {"price": anal.get_price(li[1][0]), "beds": anal.get_beds(li[1][0]), "baths": anal.get_baths(li[1][0]), "address": li[1][0], "area": anal.get_area(li[1][0]), "image_link": anal.get_img_link(li[1][0]), "rental_income": anal.get_rental_income(li[1][0]), "break_even_time": anal.break_even_time(li[1][0]), "percentage_increase": anal.percent_increase_valuation(li[1][0])}

    # options["g2p2"] = {"price": anal.get_price(li[2][0]), "beds": anal.get_beds(li[2][0]), "baths": anal.get_baths(li[2][0]), "address": li[2][0], "area": anal.get_area(li[2][0]), "image_link": anal.get_img_link(li[2][0]), "rental_income": anal.get_rental_income(li[2][0]), "break_even_time": anal.break_even_time(li[2][0]), "percentage_increase": anal.percent_increase_valuation(li[2][0])}

    # return_dic["key"]["group2_rec"] = options

    return jsonify({"message": "I am useless"})

    



@app.route('/pot1/', methods = ['GET'])
def get_pot1():
    return jsonify(pot1)


@app.route('/pot2/', methods = ['GET'])
def get_pot2():
    return jsonify(pot2)


@app.route('/group1_rec/', methods = ['GET'])
def grp1_rec():
    li = anal.predict("group1")
    
    options = {}
    options["p0"] = {"price": anal.get_price(li[0][0]), "beds": anal.get_beds(li[0][0]), "baths": anal.get_baths(li[0][0]), "address": li[0][0], "area": anal.get_area(li[0][0]), "image_link": anal.get_img_link(li[0][0]), "rental_income": anal.get_rental_income(li[0][0]), "break_even_time": anal.break_even_time(li[0][0]), "percentage_increase": anal.percent_increase_valuation(li[0][0])}
    
    options["p1"] = {"price": anal.get_price(li[1][0]), "beds": anal.get_beds(li[1][0]), "baths": anal.get_baths(li[1][0]), "address": li[1][0], "area": anal.get_area(li[1][0]), "image_link": anal.get_img_link(li[1][0]), "rental_income": anal.get_rental_income(li[1][0]), "break_even_time": anal.break_even_time(li[1][0]), "percentage_increase": anal.percent_increase_valuation(li[1][0])}

    options["p2"] = {"price": anal.get_price(li[2][0]), "beds": anal.get_beds(li[2][0]), "baths": anal.get_baths(li[2][0]), "address": li[2][0], "area": anal.get_area(li[2][0]), "image_link": anal.get_img_link(li[2][0]), "rental_income": anal.get_rental_income(li[2][0]), "break_even_time": anal.break_even_time(li[2][0]), "percentage_increase": anal.percent_increase_valuation(li[2][0])}

    mother_dic = {"key": options}

    
    return jsonify(mother_dic)


@app.route('/group2_rec/', methods = ["GET"])
def grp2_rec():
    li = anal.predict("group2")
    
    options = {}
    options["p0"] = {"price": anal.get_price(li[0][0]), "beds": anal.get_beds(li[0][0]), "baths": anal.get_baths(li[0][0]), "address": li[0][0], "area": anal.get_area(li[0][0]), "image_link": anal.get_img_link(li[0][0]), "rental_income": anal.get_rental_income(li[0][0]), "break_even_time": anal.break_even_time(li[0][0]), "percentage_increase": anal.percent_increase_valuation(li[0][0])}
    
    options["p1"] = {"price": anal.get_price(li[1][0]), "beds": anal.get_beds(li[1][0]), "baths": anal.get_baths(li[1][0]), "address": li[1][0], "area": anal.get_area(li[1][0]), "image_link": anal.get_img_link(li[1][0]), "rental_income": anal.get_rental_income(li[1][0]), "break_even_time": anal.break_even_time(li[1][0]), "percentage_increase": anal.percent_increase_valuation(li[1][0])}

    options["p2"] = {"price": anal.get_price(li[2][0]), "beds": anal.get_beds(li[2][0]), "baths": anal.get_baths(li[2][0]), "address": li[2][0], "area": anal.get_area(li[2][0]), "image_link": anal.get_img_link(li[2][0]), "rental_income": anal.get_rental_income(li[2][0]), "break_even_time": anal.break_even_time(li[2][0]), "percentage_increase": anal.percent_increase_valuation(li[2][0])}

    mother_dic = {"key": options}

    
    return jsonify(mother_dic)





port = int(os.environ.get("PORT", 5000))
if __name__ == "__main__":
    app.run(debug = True, host='192.168.38.240', port=port) #debug will allow changes without shutting down the server 