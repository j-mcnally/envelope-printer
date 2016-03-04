# Envelope Printer Service

Send a POST request to the server with the address information, and an evelope will print somewhere.

##Example Request

```
POST /envelope HTTP/1.1
Content-Type: application/x-www-form-urlencoded
Host: localhost:4567
Connection: close
User-Agent: Paw/2.2.7 (Macintosh; OS X/10.10.5) GCDHTTPRequest
Content-Length: 113

code=SOME_CODE&address1=800+W.+Huron+St&name=Justin+McNally&city=Chicago&state=IL&zipcode=60642
```

##Parameters

*All fields are required unless noted optional*

```
code: A predefined security code
name: Mailing name
address1: Address Line 1
address2: Address Line 2 (Optional)
city: City name
state: Two letter state abbreviation
zipcode: 5 digit zipcode
```
