//var re = /^{\w*}$/;
var re = /^{/;
console.log( re.test('{}') ); // 
console.log( re.test('{ }') ); // 
console.log( re.test('{xxx }') ); // 
console.log( re.test('010-1234x') ); // 
