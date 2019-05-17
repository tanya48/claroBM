/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // Select/Deselect checkboxes
    var checkbox = $('table tbody input[type="checkbox"]');
    $("#selectAll").click(function () {
        if (this.checked) {
            checkbox.each(function () {
                this.checked = true;
            });
        } else {
            checkbox.each(function () {
                this.checked = false;
            });
        }
    });
    checkbox.click(function () {
        if (!this.checked) {
            $("#selectAll").prop("checked", false);
        }
    });

    var term = "text";
    //Console.log(term);
    var re = new RegExp("^([a-z0-9]{5,})$");
    if (re.test(term)) {
        console.log("Valid");
    } else {
        console.log("Invalid");
    }
});
function noBack()
{
    window.history.forward();
}
noBack();
window.onload = noBack;
window.onpageshow = function (evt) {
    if (evt.persisted)
        noBack();
}
window.onunload = function () {
    void (0);
}
function addFields() {
    // Number of inputs to create
    var number = document.getElementById("member").value;
    // Container <div> where dynamic content will be placed
    var container = document.getElementById("container");
    // Clear previous contents of the container
    while (container.hasChildNodes()) {
        container.removeChild(container.lastChild);
    }
    for (i = 0; i < number; i++) {
        // Append a node with a random text
        container.appendChild(document.createTextNode("Port " + (i + 1)));
        // Create an <input> element, set its type and name attributes
        var input = document.createElement("input");
        input.type = "text";
        input.setAttribute('class', 'form-control');
        input.name = "central.cp[" + i + "].cport";
        input.setAttribute("required", "");
        container.appendChild(input);
        // Append a line break 
        container.appendChild(document.createElement("br"));
    }
}

function checkInpCU()
{
    //For username field
    var x = document.forms["addCuForm"]["mcuname"].value;
    var regex = /^[a-zA-Z0-9]+$/; //change for claro Regex
    if (!x.match(regex))
    {
        $("#response").animate({
            height: '+=72px'
        }, 300);

        $('<div class="alert alert-danger unameAlert">' +
                '<button type="button" class="close" data-dismiss="alert">' +
                '&times;</button>Username cannot contain special characters!</div>').hide().appendTo('#response').fadeIn(1000);

        $(".unameAlert").delay(3000).fadeOut(
                "normal",
                function () {
                    $(this).remove();
                });
        $("#response").delay(4000).animate({
            height: '-=72px'
        }, 300);
        return false;
    }
    
    //For password
    var x = document.forms["addCuForm"]["mcupass"].value;
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[.\-_!@#\$%\^&\*])(?=.{8,})/; //change for claro Regex
    if (!x.match(regex))
    {
        $("#response").animate({
            height: '+=72px'
        }, 300);

        $('<div class="alert alert-danger upassAlert">' +
                '<button type="button" class="close" data-dismiss="alert">' +
                '&times;</button>Password must follow the rules above!</div>').hide().appendTo('#response').fadeIn(1000);

        $(".upassAlert").delay(3000).fadeOut(
                "normal",
                function () {
                    $(this).remove();
                });
        $("#response").delay(4000).animate({
            height: '-=72px'
        }, 300);
        return false;
    }
    
    //For password confirmation
    var x = document.forms["addCuForm"]["mcupass"].value;
    var y = document.forms["addCuForm"]["mcucpass"].value;
    if (x != y)
    {
        $("#response").animate({
            height: '+=72px'
        }, 300);

        $('<div class="alert alert-danger ucpassAlert">' +
                '<button type="button" class="close" data-dismiss="alert">' +
                '&times;</button>Password did not match!</div>').hide().appendTo('#response').fadeIn(1000);

        $(".ucpassAlert").delay(3000).fadeOut(
                "normal",
                function () {
                    $(this).remove();
                });
        $("#response").delay(4000).animate({
            height: '-=72px'
        }, 300);
        return false;
    }
}
function checkInpAD()
{
    //For username field
    var x = document.forms["addADForm"]["madname"].value;
    var regex = /^[a-zA-Z0-9]+$/; //change for claro Regex
    if (!x.match(regex))
    {
        $("#response").animate({
            height: '+=72px'
        }, 300);

        $('<div class="alert alert-danger unameAlert">' +
                '<button type="button" class="close" data-dismiss="alert">' +
                '&times;</button>Username cannot contain special characters!</div>').hide().appendTo('#response').fadeIn(1000);

        $(".unameAlert").delay(3000).fadeOut(
                "normal",
                function () {
                    $(this).remove();
                });
        $("#response").delay(4000).animate({
            height: '-=72px'
        }, 300);
        return false;
    }
}
function checkInpC()
{
    //For username field
    var x = document.forms["addCuForm"]["mcuname"].value;
    var regex = /^[a-zA-Z0-9]+$/; //change for claro Regex
    if (!x.match(regex))
    {
        $("#response").animate({
            height: '+=72px'
        }, 300);

        $('<div class="alert alert-danger unameAlert">' +
                '<button type="button" class="close" data-dismiss="alert">' +
                '&times;</button>Username cannot contain special characters!</div>').hide().appendTo('#response').fadeIn(1000);

        $(".unameAlert").delay(3000).fadeOut(
                "normal",
                function () {
                    $(this).remove();
                });
        $("#response").delay(4000).animate({
            height: '-=72px'
        }, 300);
        return false;
    }
}