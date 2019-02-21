console.log(console === global.console); // true 
console.log(setTimeout === global.setTimeout); // true 
console.log(process === global.process); // true 
console.log(GLOBAL === global); // true 

myVar = "test";
console.log(myVar === global.myVar); // true 

