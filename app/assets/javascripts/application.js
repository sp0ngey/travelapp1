/* Function creates and returns the sign in dialog. The dialog will now show, the "open" method must be
 * called */
function InitSignInDialog()
{
    var signInDialogDiv = $("#jbhnm-signing-identity");

    $('#jbhnm-signing-identity-form').show();
    $('#jbhnm-signing-identity-message').hide();

    signInDialogDiv.dialog({
        autoOpen: false,
        width: 350,
        modal: true,
        draggable: false,
        buttons: {
            "Sign In": function() {
                var authKey = $("#auth_key").val();
                var pwd = $("#password").val();
                var messageDiv =  $('#jbhnm-signing-identity-message');

                $('#jbhnm-signing-identity-register').next(".ui-dialog-buttonpane button:contains('Register')").attr("disabled", true);

                messageDiv.text("Please wait while we sign you in...");
                $('#jbhnm-signing-identity-form').hide();
                $('#jbhnm-signing-identity-message').removeClass("errorMsg");
                $('#jbhnm-signing-identity-message').addClass("infoMsg");
                $('#jbhnm-signing-identity-message').show();

                $.ajax({
                    type: 'post',
                    url: '/auth/identity/callback',
                    async: false,
                    data: {auth_key: authKey, password: pwd},
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8', //'application/json',
                    dataType: 'json',
                    success: function(data) {
                        console.log(data);
                        if( data['status'] == "OK" )
                        {
                            console.log("The sign in succeeded\n");
                            $('#AuthBar_In').hide();
                            $('#AuthBar_Out').show();
                            $("#jbhnm-signing-identity").dialog( "destroy" );
                        }
                        else
                        {
                            console.log("The sign in FAILED!\n");
                            $('#jbhnm-signing-identity-form').show();
                            $('#jbhnm-signing-identity-message').addClass("errorMsg");
                            $('#jbhnm-signing-identity-message').removeClass("infoMsg");
                            if( data['reason'] == "invalid_credentials" )
                                $('#jbhnm-signing-identity-message').text("Sorry, but we did not recognise either your user name or password. Please try again...");
                            else
                                $('#jbhnm-signing-identity-message').text("Sign in failed for an unknown reason! Please try again or contact support...");
                            $('#jbhnm-signing-identity-register').next(".ui-dialog-buttonpane button:contains('Register')").attr("disabled", false);
                        }

                    },
                    error: function(jqXHR, status, error) {
                        console.log("status:", status, "error:", error);
                        $("#jbhnm-signing-identity").dialog( "destroy" );
                    }
                });
            },
            Cancel: function() {
                $( this ).dialog( "destroy" );
            }
        },
        close: function() {
            //allFields.val( "" ).removeClass( "ui-state-error" );
            $( this ).dialog( "destroy" );
        }
    });

    return signInDialogDiv;
}

function InitRegisterDialog()
{
    var registerDialogDiv = $('#jbhnm-register-identity');
    $('#jbhnm-register-identity-form').show();
    $('#jbhnm-register-identity-message').hide();

    registerDialogDiv.dialog({
        autoOpen: false,
        width: 350,
        modal: true,
        draggable: false,
        buttons: {
            "Register": function() {
                var _name    = $("#name").val();
                var _pwd     = $("#password_register").val();
                var _pwdConf = $("#password_confirmation").val();
                var _email   = $("#email_register").val();

                $('#jbhnm-register-identity-form').hide();
                $('#jbhnm-register-identity-message').show();

                $('#jbhnm-register-identity').next(".ui-dialog-buttonpane button:contains('Register')").attr("disabled", true);

                $.ajax({
                    type: 'post',
                    url: '/auth/identity/register',
                    async: false,
                    data: {name: _name, password: _pwd, password_confirmation: _pwdConf, email: _email},
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: 'json',
                    success: function(data) {
                        console.log(data);

                        if( data['status'] == "OK" )
                        {
                            console.log("The register in has succeeded\n");
                            $('#jbhnm-signing-identity-message').addClass("infoMsg");
                            $('#jbhnm-signing-identity-message').removeClass("errMsg");
                            $('#jbhnm-signing-identity-message').text("Registration succeeded. Please log in...");
                            $("#jbhnm-register-identity").dialog('destroy');
                        }
                        else
                        {
                            console.log("The register in has FAILED!!\n");
                            $('#jbhnm-register-identity-message').addClass("errorMsg");
                            $('#jbhnm-register-identity-message').removeClass("infoMsg");
                            $('#jbhnm-register-identity-message').text("Registration has failed. Please try again or contact support...");
                            $('#jbhnm-register-identity-form').show();
                            $('#jbhnm-register-identity').next(".ui-dialog-buttonpane button:contains('Register')").attr("disabled", false);
                        }
                    },
                    error: function(jqXHR, status, error) {
                        console.log("status: " + status + "\nerror: " + error);
                    }
                });
            },
            Cancel: function() {
                $("#jbhnm-register-identity").dialog('destroy');
            }
        },
        close: function() {
            //allFields.val( "" ).removeClass( "ui-state-error" );
            $("#jbhnm-register-identity").dialog('destroy');
        }
    });

    return registerDialogDiv;
}

/* Execute when body has finished loading... */
$(function() {
    $("#LoginLink").click(function() {  InitSignInDialog().dialog("open"); });
    $("#RegisterLink").click(function() {  $('#jbhnm-signing-identity-message').hide(); InitRegisterDialog().dialog("open"); });
});


function AddPhotoToTripItemDialog()
{
    var mediaPartialDialogDiv = $("#media-partial");

    $("#modal-form").show();

    mediaPartialDialogDiv.dialog({
        autoOpen: false,
        width: 350,
        modal: true,
        draggable: false,
        buttons: {
            "Add to Trip Item": function() {
                var tripItemID = $("#mi_id").val();
                var photoURL = $("#url").val();
                var sourceType = $("#source").val();

                var mystr = "The trip item ID is " + tripItemID;
                $("#modal-form").hide();

                console.log(mystr)

                $.ajax({
                    type: 'post',
                    url:'/media',
                    async: false,
                    data: {mi_id: tripItemID, url: photoURL, source: sourceType},
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8', //'application/json'
                    dataType: 'json',
                    success: function(data) {

                        console.log(data);
                        if( data['status'] == "OK")
                        {
                            console.log("Successfully added photo\n");
                            $("#media-partial").dialog("destroy");
                        }
                        else
                        {
                            console.log("Something failed...\n");
                        }
                    }

                });
            },
            Cancel: function() {$(this).dialog("destroy");}
        }
    });
    return mediaPartialDialogDiv;
}



// This is for loading up the modal form when adding a photo to a trip item
$(function() {
    $("#add-photo-to-trip").click(function() {AddPhotoToTripItemDialog().dialog("open"); });
});

