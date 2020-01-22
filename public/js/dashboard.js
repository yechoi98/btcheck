

// Print Current Date (dashboard.html)
var st_date = new Date().toISOString().substr(0, 10).replace('T', ' ');
var result=document.getElementById("time-result");
result.innerHTML=st_date;