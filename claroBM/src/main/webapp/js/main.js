/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $("#lcwu").on('change', function () {
        var centralId = $(this).val();
        if (centralId)
        {
            $.ajax({
                url: "fetchProfiles",
                method: "POST",
                data: {centralId: centralId},
                dataType: "json",
                success: function (lcwup) {
                    $("#lcwup").html(lcwup);
                }
            });
        } else {
            $("#lcwup").html('<option value="">Select country first</option>');
        }
    });
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

    //Add central modal
    $("#cancelCentral").click(function () {
        $("form").trigger("reset");
        $("#em_clli").html("");
        $("#em_pip").html("");
        $("#em_pport").html("");
        $("#em_cip").html("");
        $("#em_nports").html("");
        $("#em_cports").html("");
        $("#em_lc").html("");
    });

    $("#cancelCentralUser").click(function () {
        $("form").trigger("reset");
        $("#em_cuname").html("");
        $("#em_cupass").html("");
        $("#em_cucpass").html("");
        $("#em_cucpass2").html("");
        $("#em_lcwt").html("");
    });
    $("#cancelADUser").click(function () {
        $("form").trigger("reset");
        $("#em_adname").html("");
        $("#em_lcwu").html("");
    });

    //For centrals
    var mclli;
    var mcip;
    var mpip;
    var mpport;
    var mcport;
    var nports;

    mclli = $("#mclli").val();
    mcip = $("#mcip").val();
    mpip = $("#mpip").val();
    mpport = $("#mpport").val();
    mcport = $("#mcport").val();

    //For central users
    var mcuname;
    var mcupass;
    var mcucpass;

    mcuname = $("#mcuname").val();
    mcupass = $("#mcupass").val();
    mcucpass = $("#mcucpass").val();

    $("#mcuname").on('change keyup', function () {
        mcuname = $("#mcuname").val();
        var regex = /^[a-zA-Z0-9]+$/; //change for claro Regex
        if (!mcuname.match(regex))
        {
            $("#em_cuname").html("Username cannot contain special characters.");
        }
        else
        {
            $("#em_cuname").html("");
        }
    });
    $("#mcupass").on('change keyup', function () {
        mcupass = $("#mcupass").val();
        //<input type="text" onkeyup="this.value = this.value.toUpperCase();"> for the uppercase
        var regex = /^(?=.*[a-zA-Z0-9]).{4,8}$/;
        //var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{4,8}$/; //change for claro Regex
        if (!mcupass.match(regex))
        {
            $("#em_cupass").html("Enter a valid password.");
        }
        else
        {
            $("#em_cupass").html("");
        }
    });
    $("#mcucpass").on('change keyup', function () {
        mcupass = $("#mcupass").val();
        mcucpass = $("#mcucpass").val();
        if (mcupass != mcucpass)
        {
            $("#em_cucpass").html("Passwords must match.");
            $("#em_cucpass2").html("");
        }
        else
        {
            $("#em_cucpass").html("");
            $("#em_cucpass2").html("Password match.");
        }
    });
    $("#lcwt").change(function () {
        if ($("#lcwt").val() == -1)
        {
            $("#em_lcwt").html("Please select an option.");
        } else {
            $("#em_lcwt").html("");
        }
    })

    //For AD users
    var madname;

    madname = $("#madname").val();

    $("#madname").on('change keyup', function () {
        madname = $("#madname").val();
        //var regex = /^[a-zA-Z0-9]+$/; 
        var regex = /^[a-zA-Z0-9]+(?:[-_][a-zA-Z0-9]+)*(?:[\\][a-zA-Z0-9]+)*$/; //change for claro Regex
        if (!madname.match(regex))
        {
            $("#em_adname").html("Wrong value for username.");
        }
        else
        {
            $("#em_adname").html("");
        }
    });

    $("#lcwu").change(function () {
        if ($("#lcwu").val() == -1)
        {
            $("#em_lcwu").html("Please select an option.");
        } else {
            $("#em_lcwu").html("");
        }
    });


    $("#lc").change(function () {
        if ($("#lc").val() == -1)
        {
            $("#em_lc").html("Please select an option.");
        } else {
            $("#em_lc").html("");
        }
    });
    $("#mclli").on('change keyup', function () {
        mclli = $("#mclli").val();
        var regex = /^[a-zA-Z0-9]+$/; //change for claro Regex
        if (!mclli.match(regex))
        {
            $("#em_clli").html("CLLI cannot contain special characters.");
        }
        else
        {
            $("#em_clli").html("");
        }
    });
    $("#mcip").on('change keyup', function () {
        mcip = $("#mcip").val();
        var regex = /\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b/;
        if (!mcip.match(regex))
        {
            $("#em_cip").html("Wrong IP value.");
        }
        else
        {
            $("#em_cip").html("");
        }
    });
    $("#mpip").on('change keyup', function () {
        mpip = $("#mpip").val();
        var regex = /\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b/;
        if (!mpip.match(regex))
        {
            $("#em_pip").html("Wrong IP value.");
        }
        else
        {
            $("#em_pip").html("");
        }
    });
    $("#mpport").on('change keyup', function () {
        mpport = $("#mpport").val();
        var regex = /^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$/;

        $.ajax({
            url: "checkPort",
            method: "POST",
            data: {mpport: mpport},
            success: function (itr) {
                $("#em_pport").fadeIn().html("Port already in use.");
                setTimeOut(function () {
                    $("#em_pport").fadeOut("slow");
                }, 2000);
                if (!mpport.match(regex))
                {
                    $("#em_pport").html("Value out of bounds (0 to 65535).");
                }
                else
                {
                    $("#em_pport").html("");
                }
            },
            error: function (itr) {
                if (!mpport.match(regex))
                {
                    $("#em_pport").html("Value out of bounds (0 to 65535).");
                }
                else
                {
                    $("#em_pport").html("");
                }
            }
        });
    });
    $("#mcport0").on('change keyup', function () {
        //$("#mcport").css("background-color","pink");
        mcport = $("#mcport0").val();
        var regex = /^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$/;
        $.ajax({
            url: "checkPort",
            method: "POST",
            data: {mpport: mcport},
            success: function (itr) {
                $("#em_cports0").fadeIn().html("Port already in use.");
                setTimeOut(function () {
                    $("#em_cports0").fadeOut("slow");
                }, 2000);
                if (!mcport.match(regex))
                {
                    $("#em_cports0").html("Value out of bounds (0 to 65535).");
                }
                else
                {
                    $("#em_cports0").html("");
                }
            },
            error: function (itr) {
                if (!mcport.match(regex))
                {
                    $("#em_cports0").html("Value out of bounds (0 to 65535).");
                }
                else
                {
                    $("#em_cports0").html("");
                }
            }
        });
    });
    $("#nports").on('change keyup', function () {
        nports = $("#nports").val();
        var regex = /^\d$/;
        if (!nports.match(regex))
        {
            $("#em_nports").html("Must be a number");
        }
        else
        {
            $("#em_nports").html("");
        }
    });
});

function addMoreFields() {
    // Number of inputs to create
    var number = document.getElementById("nports").value;
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
        input.id = "mcport" + i;
        input.setAttribute("required", "");

        container.appendChild(input);
        // Append a line break 
        //container.appendChild(document.createElement("br"));

        var span = document.createElement("span");
        span.id = "em_cports" + i;
        span.setAttribute('class', 'text-danger');
        container.appendChild(span);
    }
}
function addFields() {
    // Number of inputs to create
    var number = document.getElementById("nports").value;
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
        input.id = "mcport" + i;
        input.setAttribute("required", "");

        container.appendChild(input);
        // Append a line break 
        //container.appendChild(document.createElement("br"));

        var span = document.createElement("span");
        span.id = "em_cports" + i;
        span.setAttribute('class', 'text-danger');
        container.appendChild(span);
        container.appendChild(document.createElement("br"));

        var js = document.createElement('script');
        js.async = true;
        js.src = 'js/main.js';
        document.body.appendChild(js);
    }
}

function checkC()
{
    if ($("#lc").val() == -1)
    {
        $("#em_lc").html("Please select an option.");
        return false;
    }
}

function checkCU()
{
    if ($("#lcwt").val() == -1)
    {
        $("#em_lcwt").html("Please select an option.");
        return false;
    }
}
function checkAD()
{
    if ($("#lcwu").val() == -1)
    {
        $("#em_lcwu").html("Please select an option.");
        return false;
    }
    var gapRegex = /^[a-zA-Z0-9]+$/;
    var textAlert = "Username cannot contain special characters";
    return alertDiv("addADForm", "madname", gapRegex, textAlert);
}

$(function () {
    $("#mcport").on('change keyup', function () {
        mcport = $("#mcport").val();
        var regex = /^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$/;
        if (!mcport.match(regex))
        {
            $("#em_cports").html("Value out of bounds (0 to 65535).");
        }
        else
        {
            $("#em_cports").html("");
        }
    });
});