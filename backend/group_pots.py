  
def get_pots():
  ## deposit money in the account of a person


  import requests
  import json


  apiKey = "f1fbb5f9a7bfdc1597fafdf76476cfa7"

  aryan_id = "64318c009683f20dd51877cc"
  aryan_acc_id = "6431db099683f20dd51877e5"

  gus_id = "643195559683f20dd51877cd"
  gus_acc_id = "6431db1b9683f20dd51877e6"

  ched_id = "643195d89683f20dd51877ce"
  ched_acc_id = "6431db2b9683f20dd51877e7"

  aad_id = "6431c0c99683f20dd51877db"
  aad_acc_id = "6431db3d9683f20dd51877e8"

  tanay_id = "6431e53b9683f20dd51877ec"
  tanay_acc_id = "6431e7249683f20dd51877f0"

  dylan_id = "6431e5469683f20dd51877ed"
  dylan_acc_id = "6431e7339683f20dd51877f1"

  pool_id = "6431c5259683f20dd51877e0"
  pool_account_id = "6431d2149683f20dd51877e3"




  group1_total = 0
  group1_accounts = [aryan_acc_id, gus_acc_id, ched_acc_id, aad_acc_id]
  people = ["aryan", "agastya", "chedda", "aadesh"]
  people1_capital = {}

  for i in range(len(group1_accounts)):
      url = "http://api.nessieisreal.com/accounts/{}?key=f1fbb5f9a7bfdc1597fafdf76476cfa7".format(group1_accounts[i])

      response = requests.get(
        url,
        headers={'content-type':'application/json'}
      )

      people1_capital[people[i]] = eval(response.text)["balance"]
      group1_total += people1_capital[people[i]]






  group2_total = 0
  group2_accounts = [aryan_acc_id, gus_acc_id, ched_acc_id, aad_acc_id, dylan_acc_id, tanay_acc_id]
  people = ["aryan", "agastya", "chedda", "aadesh", "dylan", "tanay"]
  people2_capital = {}

  for i in range(len(group2_accounts)):
      url = "http://api.nessieisreal.com/accounts/{}?key=f1fbb5f9a7bfdc1597fafdf76476cfa7".format(group2_accounts[i])

      response = requests.get(
        url,
        headers={'content-type':'application/json'}
      )

      people2_capital[people[i]] = eval(response.text)["balance"]
      group2_total += people2_capital[people[i]]


  people1_capital["total"] = group1_total


  pot1 = {}
  pot1["pot1"] = people1_capital

  people2_capital["total"] = group2_total
  pot2 = {}
  pot2["pot2"] = people2_capital


  return [pot1, pot2]


