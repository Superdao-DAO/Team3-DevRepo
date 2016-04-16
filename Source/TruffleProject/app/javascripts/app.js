var accounts;
var account;
var balance;

// function setStatus(message) {
//   var status = document.getElementById("status");
//   status.innerHTML = message;
// };

// function refreshBalance() {
//   var meta = MetaCoin.deployed();

//   meta.getBalance.call(account, {from: account}).then(function(value) {
//     var balance_element = document.getElementById("balance");
//     balance_element.innerHTML = value.valueOf();
//   }).catch(function(e) {
//     console.log(e);
//     setStatus("Error getting balance; see log.");
//   });
// };

// function sendCoin() {
//   var meta = MetaCoin.deployed();

//   var amount = parseInt(document.getElementById("amount").value);
//   var receiver = document.getElementById("receiver").value;

//   setStatus("Initiating transaction... (please wait)");

//   meta.sendCoin(receiver, amount, {from: account}).then(function() {
//     setStatus("Transaction complete!");
//     refreshBalance();
//   }).catch(function(e) {
//     console.log(e);
//     setStatus("Error sending coin; see log.");
//   });
// };


function  loadDeployedContractAddress(){

    var contracts = [];
    contracts.push( { name: 'Doug', address: Doug.deployed } );
    console.log('Contracts ', contracts);
    
}

function addModule(name, address) {

  var DougContract  =  Doug.deployed();

  DougContract.addModule(name, address, {from: account} ).then(function(result){
      
      console.log('result : ', result);

  }).catch(function(e){
      
      console.log('Error', e);
  
  });

} 


function testUsage() {

  var testusage =  TestUsage.deployed();

  testusage.testAdd( {from: account} ).then(function(result){
      
      console.log('result : ', result);

  }).catch(function(e){
      
      console.log('Error', e);
  
  });
}


window.onload = function() {
  web3.eth.getAccounts(function(err, accs) {
    if (err != null) {
      alert("There was an error fetching your accounts.");
      return;
    }

    if (accs.length == 0) {
      alert("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
      return;
    }

    accounts = accs;
    account = accounts[0];

    //--Get Doug Contract in 
    DougContract  =  Doug.deployed();

  });
}
