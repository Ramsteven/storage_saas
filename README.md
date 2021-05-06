# miBodega 

this app was create with version of rails 6.1.3

Things you may want to cover:

*Clone repository
* you need also have installed stripe cli here you found many ways for do it https://stripe.com/docs/stripe-cli#install, we will run web_hooks for update plans and billing information.
* sudo apt update
* run yarn install
* run yarn add bootstrap jquery popper.js
* run bundle install in your terminal  nt
* inside the folder of project run:  rails db:migrate
* open other terminal and run this command this open the stripe cli, you need login before:
*	./stripe listen --forward-to localhost:3000/webhooks.
* this programs works with enviroments variables then, the first will be called WEB_TOKEN, this value is given to the command above:
* e.i.: Ready! Your webhook signing secret is whsec_iXCiAmpkhdWcqYS0BGVxco4kLHUmmzJ5 (^C to quit) 
* => you enviroment variable should be "whsec_iXCiAmpkhdWcqYS0BGVxco4kLHUmmzJ5" 
* right now we need set the variables of publisheable key and secret key this variables, for get this variables click here 
https://drive.google.com/file/d/1e08glOMqjBmRkELxiKTrAH6z7pHDObyo/view?usp=sharing

development: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encrypt:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key_encrypt: 99b8f9fdf808e8d919e1873d06b4035c <br/>

  
test: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encrypt:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key_encrypt: 99b8f9fdf808e8d919e1873d06b4035c <br/>
    
* finally run: rails server 
* go to browser and type localhost:3000
