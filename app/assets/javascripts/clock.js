//let options = {weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric'}
let today = new Date();
let am_or_pm = function(hour) {
    if (hour<12) {
        return timestamp = "AM";
    } else {
        return timestamp = "PM";
    }
};
let format_minute = function(minute) {
    if (minute<10) {
        return "0"+minute.toString();
    } else {
        return minute.toString();
    }
}
let colon = true;


document.getElementById("time").innerHTML=(today.getHours()%12).toString()+":"+format_minute(today.getMinutes())+" "+am_or_pm(today.getHours());


setInterval(function() {
    today = new Date();
    if (colon) {
        document.getElementById("time").innerHTML=(today.getHours()%12).toString()+":"+format_minute(today.getMinutes())+" "+am_or_pm(today.getHours());
        colon=false;
    } else {
        document.getElementById("time").innerHTML=(today.getHours()%12).toString()+" "+format_minute(today.getMinutes())+" "+am_or_pm(today.getHours());
        colon=true;
    }
}, 1000)