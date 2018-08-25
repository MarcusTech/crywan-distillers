
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example', require('./components/Example.vue'));

const app = new Vue({
    el: '#app'
});



$(document).ready(function(){
    // alert(window.location.hostname);
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showLocation);
    }else{
        $('#location').html('Geolocation is not supported by this browser.');
    }
});

function showLocation(position){
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;


    console.log("got location");
    $.ajax({
        type:'POST',
        url:'https://ridesafeweb.x20labs.com/admin/location_json/',
        data:'latitude='+latitude+'&longitude='+longitude,
        success:function(msg){
            //  alert(msg)
            if(msg){
                $("#location").html(msg);
                // alert(msg)
                document.cookie = "fbdata = " +msg;
            }else{
                $("#location").html('Not Available');
            }

        }


    });
}
