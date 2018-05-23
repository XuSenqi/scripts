var date = new Date();

console.log( date.getHours() );
console.log( date.getMinutes() );

// 将当前时间换成时间格式字符串
var timestamp = 1527043151;
console.log( getLocalTime( timestamp ));

function getLocalTime(nS) {  
     return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');  
}

