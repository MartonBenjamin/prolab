                                                         REST API Documentation
 
 <table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">Login</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>The login operation requires two properties: one marked as user identity and second is password.</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>POST</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/login</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Body:    
       <li> "login" : value,    </li>
        <li>"password" : value, </li> 
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description : The login is success!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: Wrong username or password!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X POST   </li>
      <li>-d '{"login":"root", "password":"root"}'  </li> 
      <li>-v https://localhost:8080/Inventory/login  </li>
  </p></td> 
  </tr>  
</table>


<table>
  <thead>
   <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">Logout</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>The Logout operation terminates user session.
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>GET</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/logout</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Headers:   
       <li> user-token: value-of-the-user-token-header-from-login  </li>       
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 200,	description : The logout is success!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p >status_code: 401, description: Invalid token, throw new InvalidTokenException!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H user-token:[`value-of-user-token-from-login`]  </li>    
      <li>-v https://localhost:8080/Inventory/logout  </li>
  </p></td> 
  </tr>  
</table>

<table>
  <thead>
   <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">Register</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>Registers user
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>PUT</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/Register</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Headers:   
	    <li> user: UNIQUE username of the new user  </li>
	    <li> password: password  </li>
	    <li> email: email address in order to send informations  </li>
	    <li> first_name: First name of the client</li>
	    <li> last_name: Last name of the client</li>
	    <li> created_at: The date of the creation</li>
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201,	description : Register is success</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p >status_code: 400, description: Missing parameters, throw new MissingParamsException</p></td>
  </tr>  
  <tr>
    
  </tr>  
</table>

<table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">ListInventory</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>Returns json data about item list for garage doors.</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>GET</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/Doors/List</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Response Body:    
       <li> "id" : value,   </li>
       <li>"name" : value, </li> 
       <li> "description" : value,   </li>
       <li> "available" : value  </li>
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description : The query is success!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: Invalid query, something is missing!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X GET   </li>
      <li>-d '{"id": 37853, "name": guitar, "description": Garage door, "available": 5}'  </li> 
      <li>-v https://localhost:8080/Inventory/Worker/List </li>
  </p></td> 
  </tr>  
</table>

<table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">ListInventoryForClient</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>Returns json data about item list for Client.</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>GET</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/Client/List</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Response Body:    
       <li> "id" : value,   </li>
       <li>"name" : value, </li> 
       <li> "description" : value,   </li>
       <li> "available" : value   </li>
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description : The query is successful!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: something is missing!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X GET   </li>
      <li>-d '{"id": 02451, "name": basketball, "description": High quality, "available": 8}'  </li> 
      <li>-v https://localhost:8080/Inventory/Client/List </li>
  </p></td> 
  </tr>  
</table>

 <table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">SetInventoryForWorkers</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>The workers log in the description, where store the product, and if they are ready with packaging.</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>PUT</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/Worker/Set</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Body:    
       <li> "id" : value,    </li>
        <li>"description" : value, </li> 
		<li>"available" : value </li> 
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description : Succesful query!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: Unsuccesful query!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X PUT   </li>
      <li>-d '{"id": 37853, "description": Garage door Location: B sector, "available": 5}'  </li> 
      <li>-v https://localhost:8080/Inventory/Set </li>
  </p></td> 
  </tr>  
</table>


 <table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">SetInventoryForAssemblyLine</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>The Assembly lines can mark the chosen products in their description.</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>PUT</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/AssemblyLine/Set</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Body:    
       <li> "id" : value,    </li>
        <li>"description" : value, </li> 
		<li>"available" : value </li> 
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description : Succesful query!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: Unsuccesful query!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X PUT   </li>
      <li>-d '{"id": 37853, "description": Garage door Assembly line: A10, "available": 5}'  </li> 
      <li>-v https://localhost:8080/Inventory/AssemblyLine/Set </li>
  </p></td> 
  </tr>  
</table>


 <table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">SetInventoryForClient</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>The client can mark sold products in the description.</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>PUT</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/SalesTeam/Set</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Body:    
       <li> "id" : value,    </li>
        <li>"description" : value, </li> 
		<li>"available" : value </li> 
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description :query is success!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: Invalid query!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X PUT   </li>
      <li>-d '{"id": 37853, "description": Garage door Status: sold, "available": 5}'  </li> 
      <li>-v https://localhost:8080/Inventory/Client/Set </li>
  </p></td> 
  </tr>  
</table>


<table>
  <thead>
  <tr>
    <td><b><p align="center">Service name</p></b></td>
    <td colspan=2><b><p align="center">TrackPackedProduct</p></b></td>
  </tr>
  </thead>
  <tr> 
    <td><p align="center">Description</p></td>
    <td><p>Find products currently being transported</p></td>
  </tr>
    <td><p align="center">Method</p></td>
    <td><p>GET</p></td>
  </tr>
  <tr>
    <td><p align="center">Path</p></td>
    <td><p>Inventory/FindPackedProduct</p></td>
  </tr>
  <tr>
    <td><p align="center">Parameters</p></td>
    <td><p> Request Body:    
       <li> "id" : value,   </li>
       <li> "name" : value, </li> 
       <li> "description" : value,   </li>
       <li> "available" : value   </li>
  </p></td>
  </tr>
  <tr>
    <td><p align="center">Response OK</p></td>
    <td><p>status_code : 201, description : Product found!</p></td>
  </tr>
  <tr>
    <td><p align="center">Response Error</p></td>
    <td><p>status_code: 401, description: Product is missing!</p></td>
  </tr>  
  <tr>
    <td><p align="center">Curl</p></td>
    <td><p>
      <li>-H Content-Type:application/json   </li>
      <li>-X POST   </li>
      <li>-d '{"id": 37853, "description": Garage door, "available": 0}'  </li> 
      <li>-v https://localhost:8080/Inventory/TrackPackedProduct </li>
  </p></td> 
  </tr>  
</table>
