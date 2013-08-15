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
        buttons: {
            "Sign In": function() {
                var authKey = $("#auth_key").val();
                var pwd = $("#password").val();
                var messageDiv =  $('#jbhnm-signing-identity-message');

                messageDiv.text("Please wait while we sign you in...");
                $('#jbhnm-signing-identity-form').hide();
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
                        if( data['status'] != "OK" )
                        {
                            $('#AuthBar').hide();
                            $("#jbhnm-signing-identity").dialog( "destroy" );
                        }
                        else
                        {
                            $('#jbhnm-signing-identity-form').show();
                            $('#jbhnm-signing-identity-message').hide();
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
            allFields.val( "" ).removeClass( "ui-state-error" );
            $( this ).dialog( "destroy" );
        }
    });

    return signInDialogDiv;
}

function InitRegisterDialog()
{
    var registerDialogDiv = $('#jbhnm-signing-identity-register');
    registerDialogDiv.dialog({
        autoOpen: false,
        width: 350,
        modal: true,
        buttons: {
            "Register": function() {
                var authKey = $("#auth_key").val();
                var pwd = $("#password").val();

                $('#jbhnm-signing-identity-form').hide();
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
                        $("#jbhnm-signing-identity").dialog('destroy');
                        if( data['status'] != "OK" )
                        {

                        }
                    },
                    error: function(jqXHR, status, error) {
                        console.log("status:", status, "error:", error);
                        $("#jbhnm-signing-identity").dialog('destroy');
                    }
                });
            },
            Cancel: function() {
                $( this ).dialog( "destroy" );
            }
        },
        close: function() {
            allFields.val( "" ).removeClass( "ui-state-error" );
            $("#jbhnm-signing-identity").dialog('destroy');
        }
    });

    return registerDialogDiv;
}

/* Execute when body has finished loading... */
$(function() {
    $("#LoginLink").click(function() {  InitSignInDialog().dialog("open"); });
    $("#RegisterLink").click(function() { InitRegisterDialog().dialog("open"); });
});