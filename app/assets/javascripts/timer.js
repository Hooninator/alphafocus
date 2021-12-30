//const { timers } = require("jquery");

let work_time = parseInt(document.getElementById("workrest").innerHTML.substr(0, 2));
let rest_time = parseInt(document.getElementById("workrest").innerHTML.substr(3, 2));
let num_sessions = parseInt(document.getElementById("session").innerHTML.substr(10, 2));
let rest=false;
let pause=false;
let seconds = parseInt(document.getElementById("timer").innerHTML.split(":")[1]);
let minutes = parseInt(document.getElementById("timer").innerHTML.split(":")[0]);

document.getElementById("pause").addEventListener("click", function() {
    if (pause==true) {
        pause=false;
        document.getElementById("timer").style.color="black"
    } else {
        pause=true;
        document.getElementById("timer").style.color="red"
    }
})

/*
while (num_sessions>0) {
    if (pause==false) {
        setInterval(function() {
            if (rest==true) {
                if (minutes<=0) {
                    rest = false;
                    minutes = work_time-1;
                    seconds = 59;
                } else if (seconds==0) {
                    seconds = 59;
                    minutes -= 1;
                } else {
                    seconds-=1;
                }
            } else {
                if (minutes<=0) {
                    num_sessions-=1;
                    rest=true;
                    minutes = rest_time-1;
                    seconds = 59;
                } else if (seconds==0) {
                    seconds = 59;
                    minutes -= 1;
                } else {
                    seconds-=1;
                }
            }
            document.getElementById("timer").innerHTML=minutes.toString()+":"+seconds.toString();
        }, 1000)
    }
}*/