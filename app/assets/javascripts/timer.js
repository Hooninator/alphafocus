//const { timers } = require("jquery");

let digit_re = /\d+\/\d+/;

let work_time = document.getElementById("workrest").innerHTML.match(digit_re)[0].split("/")[0];
let rest_time = document.getElementById("workrest").innerHTML.match(digit_re)[0].split("/")[1];
let num_sessions = document.getElementById("session").innerHTML.match(digit_re)[0].split("/")[1];
//alert(num_sessions);

/*let work_time = parseInt(document.getElementById("workrest").innerHTML.substr(0, 2));
let rest_time = parseInt(document.getElementById("workrest").innerHTML.substr(3, 2));
let num_sessions = parseInt(document.getElementById("session").innerHTML.substr(10, 2));*/
let rest=false;
let pause=false;
let curr_session = 1;
let total_sessions = num_sessions;
let seconds = parseInt(document.getElementById("timer").innerHTML.split(":")[1]);
let minutes = parseInt(document.getElementById("timer").innerHTML.split(":")[0]);

document.getElementById("pause").addEventListener("click", function() {
    if (pause==true) {
        pause=false;
        document.getElementById("timer").style.color="black";
        document.getElementById("pause").innerHTML="Pause";
    } else {
        pause=true;
        document.getElementById("timer").style.color="red";
        document.getElementById("pause").innerHTML="Resume";
    }
})

document.getElementById("gamer_button").addEventListener("click", function() {
    let response = confirm("Are you sure you want to end the session?");
    if (response==true) {
        document.getElementById("timer").innerHTML="00:00";
        minutes = seconds =0;
    } else {
        return;
    }
})

//TODO - change the sessions counter, figure out bug with rest timer 
setInterval(function() {
    if (pause==false && num_sessions>0) {
        
        if (rest==true) {
            document.getElementById("work_or_rest").innerHTML="Rest time";
            if (minutes<=0 && seconds==0) {
                rest = false;
                minutes = work_time-1;
                seconds = 59;
                curr_session+=1;
                document.getElementById("session").innerHTML="Session "+curr_session.toString()+"/"+total_sessions.toString();
            } else if (seconds==0) {
                seconds = 59;
                minutes -= 1;
            } else {
                seconds-=1;
            }
        } else {
            if (minutes<=0 && seconds==0) {
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
        if (seconds>=10) {
            document.getElementById("timer").innerHTML=minutes.toString()+":"+seconds.toString();
        } else {
            document.getElementById("timer").innerHTML=minutes.toString()+":0"+seconds.toString();
        }
       
    } else if (num_sessions==0) {
        document.getElementById("work_or_rest").innerHTML="Done!";
    }
}, 1000)
    
    